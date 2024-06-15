import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class OutlineButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color? borderColor;
  final TextStyle? textStyle;

  const OutlineButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.borderColor,
    this.textStyle,
  }) : super(key: key);

  @override
  _OutlineButtonWidgetState createState() => _OutlineButtonWidgetState();
}

class _OutlineButtonWidgetState extends State<OutlineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0.w),
        color: Colors.transparent,
        border: Border.all(
            color: widget.borderColor ??
                FlutterFlowTheme.of(context).primaryText),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
              HapticFeedback.selectionClick();
              widget.onTap();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
            child: AutoSizeText(
                    widget.text,
                    style: widget.textStyle ??
                        FlutterFlowTheme.of(context).labelExtraSmall.override(
                              useGoogleFonts: false,
                              fontWeight: FontWeight.w400,
                            ),
                  ),
          ),
        ),
      ),
    );
  }
}
