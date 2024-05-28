import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:choose_input_chips/choose_input_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/home_page/settings/edit_profile/edit_tags_screen.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../common_widgets/image_check.dart';
import '../../../common_widgets/myAppBar.dart';
import '../settings_screen.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;
  String? _base64Image;
  final _controller = Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    _controller.nameController.text = prefs!.getString(userName)!;
    _controller.headlineController.text = prefs!.getString(headline)!;
    _controller.imageController.text = prefs!.getString(imageUrl) ?? '';
  }

  // @override
  // void dispose() {
  //   _controller.nameController.dispose();
  //   _controller.headlineController.dispose();
  //   _controller.imageController.dispose();
  //   super.dispose();
  // }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
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
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

        appBar: const CustomAppBar(
          showNotificationButton: false,
          showHistoryButton: false,
          showBackButton: true,
          title: "Profile",
          showProfileButton: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.0.h),
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
                          ),
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
                              : CustomCircleAvatar(
                            radius: 64.0.w,
                            imageUrl: prefs?.getString(imageUrl),
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
                            color: FlutterFlowTheme.of(context).ffButton,
                          ),
                          child: Center(
                            child: Icon(
                              size: 20.0,
                              Icons.camera_alt_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 64.0.h),
                CustomTextField(
                  label: "Full Name",
                  controller: _controller.nameController,
                ),
                SizedBox(height: 16.0.h),
                CustomTextField(
                  label: "Headline",
                  controller: _controller.headlineController,
                  maxLines: 2,
                ),
                const Spacer(),
                FFButtonWidget(
                  onPressed: () async {
                    if (_controller.nameController.text.isEmpty) {
                      Get.snackbar("Alert", "Please fill your Name",
                      // backgroundColor: Colors.grey,
                        animationDuration: Duration(milliseconds: 500),
                        colorText: FlutterFlowTheme.of(context).primaryText
                      );
                    } else if (_controller.headlineController.text.isEmpty) {
                      Get.snackbar("Alert", "Please fill the Headline");
                      print("Null Data is There");
                    } else if (_controller.nameController.text.isNotEmpty &&
                        _controller.headlineController.text.isNotEmpty) {
                      await _controller.saveUserController();
                      await checkUser();
                      Get.to(() => SettingsScreen());
                    }
                  },
                  text: 'Update Your Profile',
                  options: CTAButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: maxLines,
        style: FlutterFlowTheme.of(context).headlineSmall,
        controller: controller,
        cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
        decoration: InputDecoration(
          alignLabelWithHint: true,
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

  const CustomImageSourceDialog({
    super.key,
    required this.onGalleryTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      alignment: Alignment.center,
      actionsPadding: EdgeInsets.all(24.0.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.w),
      ),
      actions: [
        Center(
          child: Text(
            "Choose Image Source",
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
        ),
        SizedBox(height: 24.0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                onGalleryTap();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.photo,
                    size: 20,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  SizedBox(height: 4.0.h),
                  Text(
                    "Gallery",
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
            ),
            SizedBox(width: 32.0.w),
            GestureDetector(
              onTap: () {
                onCameraTap();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  SizedBox(height: 4.0.h),
                  Text(
                    "Camera",
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
