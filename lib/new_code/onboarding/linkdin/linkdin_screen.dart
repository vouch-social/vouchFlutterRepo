import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../backend/firebase_analytics/analytics.dart';
import '../../../final_design/onboarding/linkedin/linkedin_widget.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../generated/assets.dart';

class LinkdinScreen extends StatefulWidget {
  const LinkdinScreen({super.key});

  @override
  State<LinkdinScreen> createState() => _LinkdinScreenState();
}

class _LinkdinScreenState extends State<LinkdinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140.0.h,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 176.0.w,
                    width: 176.0.w,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).fixedWhite,
                      borderRadius: BorderRadius.circular(16.0),
                    ),

                  ),
                ),
                SizedBox(height: 220.0.h),
                AutoSizeText(
                    'LinkedIn Sync',
                    style: FlutterFlowTheme.of(context).displayMedium
                ),
                SizedBox(
                  height: 8.0.h,
                ),
                AutoSizeText(
                    'Link your Linkedin for a smarter Vouch\nexperience',
                    style: FlutterFlowTheme.of(context).titleSmall
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    AutoSizeText(
                        'Well use your Linkedin photo, name, and email',
                        style: FlutterFlowTheme.of(context).labelSmall
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    AutoSizeText(
                        'Your background sharpens our search accuracy',
                        style: FlutterFlowTheme.of(context).labelSmall
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                      logFirebaseEvent('Button_request_permissions');
                      logFirebaseEvent('Button_navigate_to');

                      Get.to(() => LinkedinWidget());
                    },
                    text: 'Sync Linkedin',
                    options: CTAButton(context)
                ),
                SizedBox(
                  height: 16.0.h,
                ),
                Center(
                  child: AutoSizeText(
                      'I want to customise profile my self',
                      style: FlutterFlowTheme.of(context).labelExtraSmall
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
