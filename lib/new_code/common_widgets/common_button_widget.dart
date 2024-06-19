import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class CustomButton extends StatefulWidget {
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
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0.w),
        color: widget.backgroundColor ?? FlutterFlowTheme.of(context).primary,
        border: widget.borderColor != null ? Border.all(color: widget.borderColor!) : null,
      ),
      child: Material(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(4.0.w),
        child: InkWell(
          onTap: () {
              HapticFeedback.vibrate();
              widget.onTap();
          },
          borderRadius: BorderRadius.circular(4.0.w),
          child: Center(
            child: Padding(
              padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
              child: AutoSizeText(
                widget.text,
                style: widget.textStyle ?? FlutterFlowTheme.of(context).buttonText.override(
                  useGoogleFonts: false,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).fixedWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}