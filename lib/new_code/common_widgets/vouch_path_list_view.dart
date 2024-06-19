import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import '../../flutter_flow/flutter_flow_theme.dart';
import 'image_check.dart';

Widget vouchPath(context, pathItem, index, length, activenode) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          CircleAvatar(
              radius: 22.0.h,
              backgroundColor: activenode == pathItem.contactHashedPhone
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.transparent,
              child: CustomCircleAvatar(
                radius: 20.0.w,
                imageUrl: pathItem.image!,
              )),
          SizedBox(height: 4.0.h),
          SizedBox(
            width: 64.w,
            child: AutoSizeText(
              '${pathItem.name}',
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
          // Spacer(),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.w),
        child: Visibility(
          visible: index != length - 1 ? true : false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 4.0.h,
                width: math.max(
                  (MediaQuery.of(context).size.width - 56.0.w - (length * 64.0.h)) /
                      (length - 1),
                  8.0.w,),
                color: index == length - 2
                    ? FlutterFlowTheme.of(context).primary
                    : (pathItem.hasVouched
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context)
                    .primaryText
                    .withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
