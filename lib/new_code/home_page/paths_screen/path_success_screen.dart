import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vouch/new_code/home_page/new_home_page.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class PathSuccessScreen extends StatefulWidget {
  const PathSuccessScreen({super.key});

  @override
  State<PathSuccessScreen> createState() => _PathSuccessScreenState();
}

class _PathSuccessScreenState extends State<PathSuccessScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Get.offAll(() => NewHomePage());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Column(
              children: [
                SizedBox(
                  height: 142.0.h,
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
                    child: Center(
                      child: Lottie.network(
                        'https://lottie.host/fc0406a9-e33d-4f7a-b2a4-6b584ef8ff80/i9UZ7YLgOW.json',
                        height: 124.0.h,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(30.0),
                        animate: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0.h,
                ),
                AutoSizeText(
                  "Successful!",
                  style: FlutterFlowTheme.of(context).displayMedium,
                ),
                SizedBox(
                  height: 8.0.h,
                ),
                AutoSizeText(
                  "Message sent via Path",
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
          ]),
        ),
      ),
    );
  }
}
