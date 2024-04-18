import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/onboarding/customize_profile/tags_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details_controller.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../linkdin/linkdin_screen.dart';


class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _controller = Get.put(UserDetailsController());

  File? _imageFile;
  String? _base64Image;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      setState(() {
        _imageFile = imageFile;
        _base64Image = base64Encode(imageFile.readAsBytesSync());
        _controller.imageController.text = _base64Image!;
        print(_controller.imageController.text);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      setState(() {
        _imageFile = imageFile;
        _base64Image = base64Encode(imageFile.readAsBytesSync());
        _controller.imageController.text = _base64Image!;
        print("Base 64 : ${_controller.imageController.text}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.0.h,
              ),
              AutoSizeText(
                'Hello',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      useGoogleFonts: false,
                    ),
              ),
              AutoSizeText(
                'Please update your details',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      useGoogleFonts: false,
                    ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 128.h,
                      width: 128.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.w),
                        color: FlutterFlowTheme.of(context).container1,
                      ),
                      child: Center(
                        child: _imageFile != null
                            ? ClipOval(
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                                height: 128.h,
                                width: 128,
                              ),
                            )
                            : Text(
                                'V',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w600,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      useGoogleFonts: false,
                                    ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.0,
                      left: 96.0,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomImageSourceDialog(
                                onGalleryTap: _getImageFromGallery,
                                onCameraTap: _getImageFromCamera,
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: FlutterFlowTheme.of(context).primary),
                          child: Center(
                              child: Icon(
                            Icons.camera_alt_rounded,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.0.h,
              ),
              CustomTextField(
                label: "Name",
                controller: _controller.nameController,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              CustomTextField(
                label: "Headline",
                controller: _controller.headlineController,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Hero(
                tag: "Tags",
                child: Material(
                  color: Colors.transparent,
                  child: Stack(children: [
                    Container(
                      height: 56.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Tags',
                          floatingLabelStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Bricolage Grotesque',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    useGoogleFonts: false,
                                  ),
                          labelStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Bricolage Grotesque',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    useGoogleFonts: false,
                                  ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground
                                  .withAlpha(76),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground
                                  .withAlpha(76),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TagsScreen());
                      },
                      child: Container(
                        height: 56,
                        color: Colors.transparent,
                      ),
                    ),
                  ]),
                ),
              ),
              const Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  // logFirebaseEvent(
                  //     'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                  // logFirebaseEvent('Button_request_permissions');
                  // logFirebaseEvent('Button_navigate_to');

                  const GetSnackBar(title: "Alert",message: "Please fill your Name",);
                  // if(_controller.nameController.text.isEmpty ){
                  //   const GetSnackBar(title: "Alert",message: "Please fill your Name",);
                  // }else if( _controller.headlineController.text.isEmpty){
                  //   const GetSnackBar(title: "Alert",message: "Please fill the Headline",);
                  //   print("Null Data is There");
                  // }
                  // else{
                  //   Get.to(() => TagsScreen());
                  // }
                },
                text: 'Update Your Profile',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 64.0.h,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Bricolage Grotesque',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const LinkdinScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsLinkdinSvg,
                      height: 16.0.h,
                      width: 16.0.h,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    AutoSizeText(
                      'Go back and update LinkedIn',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: label,
          floatingLabelStyle: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Bricolage Grotesque',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                useGoogleFonts: false,
              ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Bricolage Grotesque',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                useGoogleFonts: false,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context)
                  .secondaryBackground
                  .withAlpha(76),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context)
                  .secondaryBackground
                  .withAlpha(76),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class CustomImageSourceDialog extends StatelessWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;

  const CustomImageSourceDialog({
    required this.onGalleryTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Choose Image Source"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text("Gallery"),
            onTap: () {
              onGalleryTap();
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Camera"),
            onTap: () {
              onCameraTap();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
