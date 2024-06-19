import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../common_widgets/image_check.dart';

Widget hunters(hunters, context) {
  if (hunters.length == 0) {
    return SizedBox(
      width: 100.0.w,
      height: 24.0.h,
      child: AutoSizeText(
        "Nobody is hunting",
        minFontSize: 0.0,
        style: FlutterFlowTheme.of(context).bodyLarge.override(
            useGoogleFonts: false,
            color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
            fontSize: 10.0,
            fontWeight: FontWeight.w400),
      ),
    );
  } else {
    return Row(
      children: [
        SizedBox(
          width: 48.0.w,
          height: 24.0.h,
          child: Stack(
            children: [
              hunters.length >= 1
                  ? Positioned(
                  left: 0,
                  child: CustomCircleAvatar(
                    imageUrl: hunters[0].user.photourl,
                    radius: 12.0.w,
                  ))
                  : Container(),
              hunters.length >= 2
                  ? Positioned(
                  left: 12.0.w,
                  child: CustomCircleAvatar(
                    imageUrl: hunters[1].user.photourl,
                    radius: 12.0.w,
                  ))
                  : Container(),
              hunters.length >= 3
                  ? Positioned(
                  left: 24.0.w,
                  child: CustomCircleAvatar(
                    imageUrl: hunters[2].user.photourl,
                    radius: 12.0.w,
                  ))
                  : Container()
            ],
          ),
        ),
        SizedBox(
          width: 8.0.w,
        ),
        SizedBox(
          //padding: EdgeInsets.only(right: 24),
          width: 120.0.w,
          child: AutoSizeText(
            hunters.length == 1
                ? '${getFirstName(hunters[0].user.name)} is hunting'
                : hunters.length == 2
                ? '${getFirstName(hunters[0].user.name)} & ${getFirstName(hunters[1].user.name)} are hunting'
                : hunters.length >= 3
                ? '${getFirstName(hunters[0].user.name)}, ${getFirstName(hunters[1].user.name)} & ${hunters.length - 2} more are hunting'
                : "",
            minFontSize: 0.0,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                useGoogleFonts: false,
                color:
                FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
                fontSize: 8.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
String getFirstName(String fullName) {
  List<String> nameParts = fullName.split(' ');
  String firstName = nameParts.isNotEmpty ? nameParts[0] : '';
  return firstName;
}