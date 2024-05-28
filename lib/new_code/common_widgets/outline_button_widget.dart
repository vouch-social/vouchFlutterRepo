import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? borderColor;
  final TextStyle? textStyle;

  const OutlineButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.borderColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0.w),
          color: Colors.transparent,
          border: Border.all(color: borderColor ?? FlutterFlowTheme.of(context).primaryText),
        ),
        child: AutoSizeText(
          text,
          style: textStyle ?? FlutterFlowTheme.of(context).labelExtraSmall.override(
            useGoogleFonts: false,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
