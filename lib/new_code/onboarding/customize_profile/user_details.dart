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
    const mockResults = <Tags>[
      Tags(
        'John Doe',
      ),
      Tags(
        'Paul',
      ),
      Tags(
        'Fred',
      ),
      Tags(
        'Brian',
      ),
      Tags(
        'John',
      ),
      Tags(
        'Thomas',
      ),
      Tags(
        'Nelly',
      ),
      Tags(
        'Marie',
      ),
      Tags(
        'Charlie',
      ),
      Tags(
        'Diana',
      ),
      Tags(
        'Ernie',
      ),
      Tags(
        'Gina',
      ),
    ];
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
              Hero(
                tag: "Tags",
                child: Material(
                  color: Colors.transparent,
                  child: Stack(children: [
                    Container(
                        height: 72.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ChipsInput(
                          initialValue: _controller.tagsController,
                          textStyle: FlutterFlowTheme.of(context).labelExtraSmall,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: FlutterFlowTheme.of(context)
                            //     .textFieldBackground,
                            labelText: "Tags",
                            floatingLabelStyle:
                                FlutterFlowTheme.of(context).bodyLarge,
                            labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
                            //     width: 1.0,
                            //   ),
                            //   borderRadius: BorderRadius.circular(8.0),
                            // ),
                          ),
                          findSuggestions: (String query) {
                            if (query.isNotEmpty) {
                              var lowercaseQuery = query.toLowerCase();
                              final results = mockResults.where((profile) {
                                return profile.tags
                                    .toLowerCase()
                                    .contains(query.toLowerCase());
                              }).toList(growable: false)
                                ..sort((a, b) => a.tags
                                    .toLowerCase()
                                    .indexOf(lowercaseQuery)
                                    .compareTo(b.tags
                                        .toLowerCase()
                                        .indexOf(lowercaseQuery)));
                              return results;
                            }
                            return mockResults;
                          },
                          onChanged: (List<Tags> tags) {
                            _controller.tagsController.value = tags;
                            print("Tags : ${_controller.tagsController}");
                          },
                          chipBuilder: (context, state, Tags profile) {
                            return InputChip(
                              backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ?
                              FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9):
                              FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
                              labelStyle: FlutterFlowTheme.of(context).labelSmall,
                              key: ObjectKey(profile),
                              label: Text(profile.tags),
                              onDeleted: () => state.deleteChip(profile),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, state, Tags profile) {
                            return Wrap(children: [
                              InputChip(
                                backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ?
                                FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9):
                                FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
                                labelStyle: FlutterFlowTheme.of(context).labelSmall,
                                elevation: 0,
                                key: ObjectKey(profile),
                                label: Text(profile.tags),
                                onPressed: () =>
                                    state.selectSuggestion(profile),
                              ),
                            ]);
                          },
                        )),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TagsScreen());
                      },
                      child: Container(
                        height: 72,
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
                    } else if (_controller.tagsController.isEmpty) {
                      const GetSnackBar(
                        title: "Alert",
                        message: "Please fill your Tags",
                      );
                      Get.to(TagsScreen());
                    } else if (_controller.nameController.text.isNotEmpty &&
                        _controller.headlineController.text.isNotEmpty &&
                        _controller.tagsController.isNotEmpty) {
                      await _controller.saveUserController();
                    }
                  },
                  text: 'Update Your Profile',
                  options: CTAButton(context)),
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
                      width: 16.0.w,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    AutoSizeText(
                      'Go back and update LinkedIn',
                      style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        decoration: TextDecoration.underline
                      ),
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
        style: FlutterFlowTheme.of(context).headlineSmall,
        controller: controller,
        cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: FlutterFlowTheme.of(context).textFieldBackground,
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
