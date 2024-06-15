import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' as qr_scanner;
import 'package:universal_io/io.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart' as ml_kit;
import 'package:url_launcher/url_launcher.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '/new_code/common_widgets/custom_snackbar.dart';
import '/new_code/home_page/paths_screen/paths_screen.dart';

import '../HomePage/paths_list_controller.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  qr_scanner.Barcode? qrResult;
  qr_scanner.QRViewController? qrController;
  ml_kit.Barcode? imageResult;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.camera.request();
      if (status.isDenied || status.isPermanentlyDenied) {
        showCustomSnackbar(title: "Alert", message: "");
        return;
      }
    }
    if (status.isGranted) {
      setState(() {});
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      qrController?.pauseCamera();
      final inputImage = ml_kit.InputImage.fromFilePath(pickedFile.path);
      final barcodeScanner = ml_kit.GoogleMlKit.vision.barcodeScanner();
      final List<ml_kit.Barcode> barcodes =
          await barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        setState(() {
          imageResult = barcodes.first;
        });
      }
      await qrController?.resumeCamera();
      qrController?.toggleFlash();
      await Future.delayed(Duration(microseconds: 1));
      qrController?.toggleFlash();
    }
  }

  String? _extractHashedPhone(String? data) {
    const prefix = "https://qr.vouch.social/hashedPhone=";
    if (data != null && data.startsWith(prefix)) {
      String hashedPhone = data.substring(prefix.length);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Get.off(() => PathsScreen(
          hashedPhone: hashedPhone,
        ));
      });

      return hashedPhone;
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: () async {
                    qrController?.toggleFlash();
                    await Future.delayed(Duration(microseconds: 1));
                    qrController?.toggleFlash();
                  },
                  child: qr_scanner.QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: qr_scanner.QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 8.0.w,
                      borderLength: 2.0.w,
                      borderWidth: 8.0.w,
                      cutOutSize: 300.0.w,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      if (qrResult != null)
                        Text(
                          'Barcode Type: ${describeEnum(qrResult!.format)}\nData: ${_extractHashedPhone(qrResult!.code) ?? "Wrong QR"}',
                          style: FlutterFlowTheme.of(context).labelExtraSmall,
                        )
                      else if (imageResult != null)
                        Text(
                          'Barcode Type: ${describeEnum(imageResult!.type)}\nData Gallery: ${_extractHashedPhone(imageResult!.displayValue) ?? "Wrong QR"}',
                          style: FlutterFlowTheme.of(context).labelExtraSmall,
                        )
                      else
                        Text(
                          'Scan a code',
                          style: FlutterFlowTheme.of(context).labelExtraSmall,
                        ),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text(
                          'Pick Image from Gallery',
                          style: FlutterFlowTheme.of(context).labelExtraSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(qr_scanner.QRViewController controller) {
    setState(() {
      qrController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrResult = scanData;
      });
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
