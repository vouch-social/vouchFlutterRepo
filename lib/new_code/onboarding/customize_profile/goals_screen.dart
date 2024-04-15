import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.0.h,
              ),
              AutoSizeText(
                'Hey Nirant',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              AutoSizeText(
                'good morning,',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 24.0.h,
              ),
              AutoSizeText(
                'Set your goal',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              AutoSizeText(
                'Please set at least 3 goals. You will have the\n ability to edit your choices at any point.',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 68.0.h,
              ),
          Container(
            height: 80.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0.w),
              border: Border.all(),// Border radius
            ),
            child: TextField(
              minLines: 3,
              maxLines: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEBF2F4),
                contentPadding: EdgeInsets.all(12.0.w),
                hintText: 'Type here...',
                hintStyle: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0,
                ),
              ),

            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
