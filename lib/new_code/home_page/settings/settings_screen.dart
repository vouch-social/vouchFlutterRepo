import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import 'package:vouch/new_code/home_page/settings/edit_profile/edit_profile_screen.dart';
import 'package:vouch/new_code/onboarding/auth_screen/login_screen/login_screen.dart';
import 'package:vouch/new_code/onboarding/linkdin/linkdin_screen.dart';

import '../../common_widgets/myAppBar.dart';

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

              Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    child: ClipRRect(
                      child: Image.asset(Assets.assetsImage951),
                    ),
                  ),
                  SizedBox(
                    width: 16.0.w,
                  ),
                  AutoSizeText(
                    "Nirant Ramakuru",
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                      child: Icon(Icons.edit,size: 24.0.w,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.6),),
                  onTap: (){
                        Get.to(() => EditProfileScreen());
                  },
                  ),
                  
                ],
              ),
              SizedBox(
                height: 28.0.h,
              ),
              AutoSizeText(
                'Account',
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 20.0.h,
              ),
        SizedBox(
            height: 64.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined),
                SizedBox(
                  width: 28.0.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0.h,
                    ),
                    AutoSizeText(
                      "Email",
                      style:
                      FlutterFlowTheme.of(context).titleLarge,
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    AutoSizeText(
                      'nirantr@gmail.com',
                      style:
                      FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    //Get.to(() => const EditGoalsScreen());
                  },
                  child: Icon(Icons.arrow_forward_ios,size: 20,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),),
                )
              ],
            )),
              SizedBox(
                height: 8.0.h,
              ),
              SizedBox(
                  height: 64.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.adjust_rounded),
                      SizedBox(
                        width: 28.0.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.0.h,
                          ),
                          AutoSizeText(
                            "Edit your goals",
                            style:
                            FlutterFlowTheme.of(context).titleLarge,
                          ),
                          SizedBox(
                            height: 8.0.h,
                          ),
                          AutoSizeText(
                            'goals',
                            style:
                            FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const EditGoalsScreen());
                        },
                        child: Icon(Icons.arrow_forward_ios,size: 20,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),),
                      )
                    ],
                  )),
              SizedBox(
                height: 8.0.h,
              ),
              SizedBox(
                  height: 64.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.adjust_rounded),
                      SizedBox(
                        width: 28.0.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.0.h,
                          ),
                          AutoSizeText(
                            "Linkedin Sync",
                            style:
                            FlutterFlowTheme.of(context).titleLarge,
                          ),
                          SizedBox(
                            height: 8.0.h,
                          ),
                          AutoSizeText(
                            'Not Completed',
                            style:
                            FlutterFlowTheme.of(context).titleSmall,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Get.to(() =>  const LinkedinScreen());
                        },
                        child: Icon(Icons.arrow_forward_ios,size: 20,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),),
                      )
                    ],
                  )),
              SizedBox(
                height: 8.0.h,
              ),
              AutoSizeText(
                'App',
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 8.0.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      height: 64.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          iconsList[index],
                          SizedBox(
                            width: 28.0.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.0.h,
                              ),
                              AutoSizeText(
                                titleList[index],
                                style:
                                    FlutterFlowTheme.of(context).titleLarge,
                              ),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              AutoSizeText(
                                'nirantr@gmail.com',
                                style:
                                    FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ],
                          )
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8.0.h,
                  );
                },
              ),
              SizedBox(
                height: 16.0.h,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(() => const LoginScreen());
                },
                child: AutoSizeText(
                  'LogOut',
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
