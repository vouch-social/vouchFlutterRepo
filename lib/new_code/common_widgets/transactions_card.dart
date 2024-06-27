import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';

Widget transactionsCard(color,context,icon){
  return Container(
    padding: EdgeInsets.all(8.0.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0.w),
      color: color
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.w),
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Icon(icon),
        ),
      ],
    ),
  );
}