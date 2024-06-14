import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';

class MyOtherVouchesScreen extends StatefulWidget {
  const MyOtherVouchesScreen({super.key});

  @override
  State<MyOtherVouchesScreen> createState() => _MyOtherVouchesScreenState();
}

class _MyOtherVouchesScreenState extends State<MyOtherVouchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        children: [
          SizedBox(height: 24.0.h,),
          AutoSizeText("Your vouches will be available here!",
          style: FlutterFlowTheme.of(context).headlineSmall,
          )
        ],
      ),
    );
  }
}
