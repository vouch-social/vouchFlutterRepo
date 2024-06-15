import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/generated/assets.dart';
import '../../../main.dart';
import '../../backend/backend_constants.dart';
import '../../common_widgets/image_check.dart';

class MyCodeScreen extends StatefulWidget {
  const MyCodeScreen({super.key});

  @override
  State<MyCodeScreen> createState() => _MyCodeScreenState();
}

class _MyCodeScreenState extends State<MyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              SizedBox(height: 24.0.h,),
              Center(
                  child: CustomCircleAvatar(
                      radius: 64.0.w,
                      imageUrl: prefs?.getString(imageUrl)
                  )
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Center(
                child: AutoSizeText(
                  '${prefs?.getString(userName)}',
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText("+ 91 - ",style: FlutterFlowTheme.of(context).labelSmall),
                  AutoSizeText(
                    (prefs?.getString(phone))!.replaceRange(0, 8, "XXXXXXXX"),
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 8.0.h,),
              Center(
                child: AutoSizeText(
                  "${prefs?.getString(headline)}",
                  style: FlutterFlowTheme.of(context).labelExtraSmall,
                ),
              ),
              SizedBox(
                height: 32.0.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                  padding: EdgeInsets.all(8.0.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0.w),

                  ),
                  child:
                  BarcodeWidget(
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                    ),
                    data: 'https://qr.vouch.social/hashedPhone=${prefs?.getString(loggedInUserHashedPhone)}',
                    width: 200.0.w,
                    height: 200.0.h,
                  ),
                  ),
                  Container(
                    width: 40.0.w,
                    height: 40.0.h,
                    padding: EdgeInsets.all(4.0.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0.w)
                    ),
                    child: Image.asset(Assets.assetsSplashImage),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
