import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';

class MaintenanceModeScreen extends StatefulWidget {
  const MaintenanceModeScreen({super.key});

  @override
  State<MaintenanceModeScreen> createState() => _MaintenanceModeScreenState();
}

class _MaintenanceModeScreenState extends State<MaintenanceModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 200.0.h,
                    child: Lottie.network(
                      'https://lottie.host/df0d425f-6115-4942-b7ae-fed819f681d8/3RvbwtuG5T.json',
                      frameRate: FrameRate(30.0),
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                ),
                SizedBox(height: 24.0.w,),
                AutoSizeText("Server Under Maintenance",
                style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                SizedBox(
                  height: 16.0.w,
                ),
                AutoSizeText("Please visit us after sone time",style: FlutterFlowTheme.of(context).titleLarge,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
