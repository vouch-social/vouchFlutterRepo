import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/main.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import 'package:vouch/new_code/home_page/settings/edit_profile/edit_profile_screen.dart';
import 'package:vouch/new_code/onboarding/linkdin/linkdin_screen.dart';
import '../../common_widgets/myAppBar.dart';
import 'edit_profile/edit_tags_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Icon> iconsList = [
    Icon(Icons.email_outlined),
    Icon(Icons.adjust_rounded),
    Icon(Icons.data_thresholding_outlined),
    Icon(Icons.archive_outlined),
    Icon(Icons.integration_instructions_outlined)
  ];
  List<String> titleList = [
    'Email',
    'Edit Your Goals',
    'Linkedin Sync',
    'Archived',
    'Instructions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        showProfileButton: false,
        title: "Settings",
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 128.0.h,
                  width: 128.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0.w)),
                  child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: prefs?.getString(imageUrl) == null
                          ? Image.asset(Assets.assetsImage951)
                          : prefs!.getString(imageUrl)!.contains('http')
                              ? Image.network("${prefs!.getString(imageUrl)}")
                              : Image.memory(
                                  base64Decode(prefs!.getString(imageUrl)!))),
                ),
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
              Center(
                child: AutoSizeText(
                  "${prefs?.getString(headline)}",
                  style: FlutterFlowTheme.of(context).labelExtraSmall,
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => EditProfileScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 8.0.h),
                    decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(4.0.w)),
                    child: AutoSizeText(
                      'Edit Profile',
                      style: FlutterFlowTheme.of(context)
                          .labelExtraSmall
                          .override(
                              useGoogleFonts: false,
                              color: FlutterFlowTheme.of(context).fixedWhite),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0.h,
              ),

              GestureDetector(
                onTap: (){
                  if(prefs?.getBool(isLinkedinSync) == false)
                   Get.to( () => LinkedinScreen());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.0.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Linkedin sync',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                        const Spacer(),
                        prefs?.getBool(isLinkedinSync) == true
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0.w, vertical: 8.0.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0.w),
                                    color:
                                        FlutterFlowTheme.of(context).container1),
                                child: AutoSizeText(
                                  'Sync successful',
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                          useGoogleFonts: false,
                                          color: FlutterFlowTheme.of(context)
                                              .fixedBlack,
                                          fontSize: 10.sp),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0.w, vertical: 8.0.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0.w),
                                    color:
                                        FlutterFlowTheme.of(context).pastelBlue),
                                child: AutoSizeText(
                                  'Sync Now',
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                          useGoogleFonts: false,
                                          color: FlutterFlowTheme.of(context)
                                              .fixedBlack,
                                          fontSize: 10.sp),
                                ),
                              ),
                        SizedBox(
                          width: 4.0.w,
                        ),
                        prefs?.getBool(isLinkedinSync) == false ?
                        Icon(Icons.arrow_forward_ios,
                                size: 16.0.h,
                                color: FlutterFlowTheme.of(context).primaryText): Container()
                      ],
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    Divider(
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.9),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const EditTagsScreen());
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Attributes',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 16.0.h,
                            color: FlutterFlowTheme.of(context).primaryText),
                      ],
                    ),
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Divider(
                      thickness: 1.5,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.2),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const EditGoalsScreen());
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Goals',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                        const Spacer(),
                        GestureDetector(

                          child: Icon(Icons.arrow_forward_ios,
                              size: 16.0.h,
                              color: FlutterFlowTheme.of(context).primaryText),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Divider(
                      thickness: 1.5,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.2),
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: 36.0.h,
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16.0.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Contact sync',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: Icon(Icons.arrow_forward_ios,
                                  size: 16.0.h,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              const Spacer(),
              FFButtonWidget(
                  text: 'Logout', onPressed: () {}, options: CTAButton(context))
            ],
          ),
        ),
      ),
    );
  }
}
