import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vouch/new_code/home_page/HomePage/components/feedback_screen.dart';
import 'package:vouch/new_code/home_page/HomePage/components/rounded_text_field.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../bounty_screen/bounty_screen.dart';
import '../../scanner_screen/scanner_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0.w, right: 16.0.w, bottom: 16.0.h, top: 8.0.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RoundedTextField(),
          SizedBox(width: 6.w),
          Container(
            height: 50.0.h,
            width: 50.0.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.0.w),
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(36.0.w),
              color: FlutterFlowTheme.of(context).primary,
              child: InkWell(
                onTap: () {
                  Get.to(
                          transition: Transition.rightToLeftWithFade,
                          () => const ScannerScreen());
                },
                borderRadius: BorderRadius.circular(36.0.w),
                child: Icon(
                  Icons.qr_code_2_rounded,
                  color: FlutterFlowTheme.of(context).fixedWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
