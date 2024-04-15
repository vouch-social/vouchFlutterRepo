import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class ContactUploadSuccess extends StatefulWidget {
  const ContactUploadSuccess({super.key});

  @override
  State<ContactUploadSuccess> createState() => _ContactUploadSuccessState();
}

class _ContactUploadSuccessState extends State<ContactUploadSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    color: FlutterFlowTheme.of(context).primaryBackground,
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
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      useGoogleFonts: false,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "1024 ",
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      useGoogleFonts: false,
                    ),
                  ),
                      AutoSizeText(
                        "contacts imported",
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          useGoogleFonts: false,
                        ),
                      ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
