import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import '../../flutter_flow/flutter_flow_theme.dart';
import 'image_check.dart';

Widget vouchPathList(context, pathItem, index, length) {
  if (index < 0 || index >= pathItem.length) {
    return SizedBox();
  }
  print("PathItem : $pathItem");
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CustomCircleAvatar(
                  radius: 24.0.h,
                  imageUrl: pathItem[index]["image"],
                ),
                SizedBox(height: 4.0.h),
                SizedBox(
                  width: 64.0.w,
                  child: AutoSizeText(
                    '${pathItem[index]["name"]}',
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10.0,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: index != length - 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0.h),
                    height: 4.0.h,
                    width: math.max(
                      (MediaQuery.of(context).size.width - 56.0.w - (length * 64.0.h)) /
                          (length - 1),
                      8.0.w,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
