import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0.w),
          color: backgroundColor ?? FlutterFlowTheme.of(context).primary,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: AutoSizeText(
          text,
          style: textStyle ?? FlutterFlowTheme.of(context).buttonText.override(
            useGoogleFonts: false,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: FlutterFlowTheme.of(context).fixedWhite
          ),
        ),
      ),
    );
  }
}
