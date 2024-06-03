import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../search_screen/search_screen.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchScreen());
      },
      child: Hero(
        tag: "Search",
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width - 88.w,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0.w),
              color: FlutterFlowTheme.of(context).textFieldBackground,
              //border: Border.all(color: FlutterFlowTheme.of(context).textFieldBackground),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText('Search for professionals, topics, or interests',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleSmall),
            ),
          ),
        ),
      ),
    );
  }
}