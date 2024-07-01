import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/common_button_widget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/outline_button_widget.dart';

import '../home_page/settings/attributes_validation/attributes_validation_controller.dart';

class AttributesValidationCard extends StatefulWidget {
  final attributesValidation;
  final Function refreshFeeds;
  const AttributesValidationCard({super.key, this.attributesValidation, required this.refreshFeeds});

  @override
  State<AttributesValidationCard> createState() => _BountyWidgetState();
}

class _BountyWidgetState extends State<AttributesValidationCard> {

  final controller = Get.put(AttributesValidationController());

  bool _isVisible = true;

  void hideCard() {
    if (mounted) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void showCard() {
    if (mounted) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0.w),
              color: FlutterFlowTheme.of(context).textFieldBackground,
              border: Border.all(
                  color: FlutterFlowTheme.of(context).textFieldBackground)),
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCircleAvatar(imageUrl : widget.attributesValidation.user.photourl),
                  SizedBox(width: 8.0.w,),
                  AutoSizeText('${widget.attributesValidation.user.name}',
                      style: FlutterFlowTheme.of(context).bodyLarge),
                ],
              ),
              SizedBox(
                height: 8.0.h,
              ),
              AutoSizeText('${widget.attributesValidation.attribute.attribute}',
                  style: FlutterFlowTheme.of(context).bodyLarge
              ),
              SizedBox(
                height: 16.0.h,
              ),

              SizedBox(
                height: 8.0.h,
              ),
              Divider(
                color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
                height: 0.0,
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpVoteButton(text: "", onTap: () async{
                    await controller.postAttributesValidationData(widget.attributesValidation.id, true);
                    print("Calling refresh callback");
                    await widget.refreshFeeds();
                    showCard();
                    print("Refresh callback executed");
                  }),
                  SizedBox(width: 8.0.w,),
                  OutlineButtonWidget(text: "", onTap: () async{
                    await controller.postAttributesValidationData(widget.attributesValidation.id, false);
                    print("Calling refresh callback");
                    await widget.refreshFeeds();
                    showCard();
                    print("Refresh callback executed");
                  })
                ],
              ),
              SizedBox(
                height: 8.0.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class UpVoteButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const UpVoteButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.padding,
  });

  @override
  _UpVoteButtonState createState() => _UpVoteButtonState();
}

class _UpVoteButtonState extends State<UpVoteButton> {
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
              child: Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 20.0.h,
                  ),
                  SizedBox(width: 8.0.w,),
                  AutoSizeText(
                    widget.text,
                    style: widget.textStyle ?? FlutterFlowTheme.of(context).buttonText.override(
                      useGoogleFonts: false,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: FlutterFlowTheme.of(context).fixedWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


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
            child: Row(
              children: [
                Icon(Icons.thumb_down_off_alt_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 20.0.h,
                ),

                SizedBox(width: 8.0.w,),

                AutoSizeText(
                  widget.text,
                  style: widget.textStyle ??
                      FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
