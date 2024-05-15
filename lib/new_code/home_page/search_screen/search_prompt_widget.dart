import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/home_page/search_screen/search_controller.dart';

Widget searchPromptWidget(context){
  var controller = SearchScreenController();
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 32.0.h,),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 56.0.h,
            width: double.infinity,
            decoration: const BoxDecoration(
            ),
            child: SvgPicture.asset(
              'assets/welcomeLogo.svg',
              color: FlutterFlowTheme.of(context).ffButton,
            ),
          ),
        ),
        SizedBox(height: 24.0.h,),
        AutoSizeText("How can i help today?",
        style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){
            // setState(() {
            //   controller.searchController.text = 'want to find a driver';
            // });
            print("Text ${controller.searchController.text}");
          },
          child: Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
              color:  FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(12.0.w),
              border: Border.all(
                color: FlutterFlowTheme.of(context).textFieldBackground
              )
            ),
            padding: EdgeInsets.only(top: 12.0.w, bottom: 12.0.w,left: 16.0.w,right: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText("Want to find a driver",
                style: FlutterFlowTheme.of(context).labelExtraSmall,
                ),
                SizedBox(height: 4.0.h,),
                AutoSizeText('Want to find driver for car delivery, Want to find driver for car delivery.',
                minFontSize: 8,
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  useGoogleFonts: false
                ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

