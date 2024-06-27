import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:choose_input_chips/choose_input_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/search_screen/search_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/attributes_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/tags_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details_controller.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../main.dart';
import '../linkdin/linkdin_screen.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _controller = Get.put(UserDetailsController());

  File? _imageFile;
  dynamic _base64Image;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 10,
        );

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final int fileSizeInBytes = imageFile.lengthSync();
      print("File Size : $fileSizeInBytes");
      {
        setState(() {
          _imageFile = imageFile;
          _base64Image = base64Encode(imageFile.readAsBytesSync());
          _controller.imageController.text = _base64Image!;
          print("Base64 Gallery : ${_controller.imageController.text}");
        });
      }

    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera,
          imageQuality: 10,
        );
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final int fileSizeInBytes = imageFile.lengthSync();
      print("File Size : $fileSizeInBytes");
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
              // AutoSizeText('Hello',
              //     style: FlutterFlowTheme.of(context).headlineLarge),
              AutoSizeText(
                'Please update your details',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 128.h,
                      width: 128.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64.w),
                        color: FlutterFlowTheme.of(context).ffButton,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: FlutterFlowTheme.of(context).textFieldBackground,
                        )
                      ),
                      child: Center(
                        child: _imageFile != null
                            ? ClipOval(
                                child: Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                  height: 128.h,
                                  width: 128.w,
                                ),
                              )
                            : Text(
                                'NR',
                                style: FlutterFlowTheme.of(context)
                                    .buttonText,
                              ),
                      ),
                    ),
                    GestureDetector(
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
                        margin: EdgeInsets.all(4.0.w),
                        height: 32.0.h,
                        width: 32.0.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0.w),
                            color: FlutterFlowTheme.of(context).ffButton),
                        child: Center(
                            child: Icon(
                          size: 20.0,
                          Icons.camera_alt_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        )),
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
              Row(
                children: [
                  AutoSizeText("Attributes (${prefs?.getStringList(attributes)?.length})",
                  style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.to(() =>  const AttributesList(
                        items: [],
                      ));
                    },
                    child: AutoSizeText("Edit",
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).primary
                    ),
                    ),
                  )

                ],
              ),
              const Spacer(),
              FFButtonWidget(
                  onPressed: () async {
                    // logFirebaseEvent(
                    //     'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                    // logFirebaseEvent('Button_request_permissions');
                    // logFirebaseEvent('Button_navigate_to');

                    //const GetSnackBar(title: "Alert",message: "Please fill your Name",);
                    if (_controller.nameController.text.isEmpty) {
                      const GetSnackBar(
                        title: "Alert",
                        message: "Please fill your Name",
                      );
                    } else if (_controller.headlineController.text.isEmpty) {
                      const GetSnackBar(
                        title: "Alert",
                        message: "Please fill the Headline",
                      );
                      print("Null Data is There");
                    }
                    else if (_controller.imageController.text.isEmpty) {
                      const GetSnackBar(
                        title: "Alert",
                        message: "Please upload your image",
                      );
                      print("Null Data is There");
                    }else if(prefs!.getStringList(attributes)!.isEmpty){
                      Get.to( const AttributesList());
                    }
                      else if (_controller.nameController.text.isNotEmpty &&
                        _controller.headlineController.text.isNotEmpty && _controller.imageController.text.isNotEmpty) {
                      await _controller.saveUserController();
                      // await checkUser();
                      //   Get.to(() => const SearchScreen());
                      // }
                    }
                  },
                  text: 'Update Your Profile',
                  options: CTAButton(context)),
              SizedBox(
                height: 12.0.h,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const LinkedinScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsLinkdinSvg,
                      height: 16.0.h,
                      width: 16.0.w,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    AutoSizeText(
                      'Update LinkedIn Instead',
                      style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        decoration: TextDecoration.underline
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.0.h,)
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
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        style: FlutterFlowTheme.of(context).headlineSmall,
        controller: controller,
        maxLines: 2,
        minLines: 1,
        cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: label,
          floatingLabelStyle: FlutterFlowTheme.of(context).titleSmall,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: FlutterFlowTheme.of(context).titleSmall,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 1.0,
                ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
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

  const CustomImageSourceDialog({super.key,
    required this.onGalleryTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      actionsPadding: EdgeInsets.all(24.0.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0.w)
      ),
      actions: [
        Center(
          child: Text("Choose Image Source",
              style: FlutterFlowTheme.of(context).titleLarge
          ),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                onGalleryTap();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                   Icon(Icons.photo,size: 20,color: FlutterFlowTheme.of(context).primaryText,),
                  SizedBox(height: 4.0.h,),
                  Text("Gallery",
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
            ),
            SizedBox(width: 32.0.w,),
            GestureDetector(
              onTap: (){
                onCameraTap();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                   Icon(Icons.camera_alt_outlined,size: 20,color: FlutterFlowTheme.of(context).primaryText,),
                  SizedBox(height: 4.0.h,),
                  Text("Camera",
                    style: FlutterFlowTheme.of(context).labelSmall,

                  ),
                ],
              ),
            )
          ],
        ),
      ],    );
  }
}
