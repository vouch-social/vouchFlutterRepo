import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/auth/checkAuth.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';
import '/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import '/new_code/home_page/settings/edit_profile/edit_profile_screen.dart';
import '/new_code/home_page/settings/re_sync_contacts/re_sync_permissions_screen.dart';
import '/new_code/onboarding/linkdin/linkdin_screen.dart';
import '/new_code/onboarding/welcome_screen/welcome_screen.dart';
import '../../common_widgets/myAppBar.dart';
import 'edit_attributes_screen.dart';
import 'ignore_contacts/ignore_contacts_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        showProfileButton: false,
        title: "Settings",
        onBackButtonPressed: () {
               Get.offAll( () => const NewHomePage());

        },

      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    "${prefs?.getString(phone)}",
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
                height: 16.0.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const EditProfileScreen());
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
                  if(prefs?.getBool(isLinkedinSync) == false) {
                    Get.to( () => const LinkedinScreen());
                  }
                },
                child: Container(
                  color: Colors.transparent,
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
                        thickness: 1.5,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.2),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() =>  EditAttributesList(items: prefs!.getStringList(attributes),));
                },
                child: Container(
                  color: Colors.transparent,
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
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const EditGoalsScreen());
                },
                child: Container(
                  color: Colors.transparent,
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
              ),
              SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ReSyncPermissionsScreen());
                    },
                    child: Container(
                      color: Colors.transparent,
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
                  )),
              SizedBox(
                  height: 36.0.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const IgnoreContactsScreen());
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.0.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Ignore Contacts',
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
                    ),
                  )),
              const Spacer(),
              FFButtonWidget(
                  text: 'Logout', onPressed: () async{
                   await prefs?.setString(authToken, '');
                    Get.offAll(() => const WelcomeScreen());
              }, options: CTAButton(context))
            ],
          ),
        ),
      ),
    );
  }
}
