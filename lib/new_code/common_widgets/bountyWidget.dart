import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/generated/assets.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/common_widgets/common_button_widget.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/home_page/HomePage/controllers/feeds_controller.dart';
import '/new_code/home_page/HomePage/controllers/start_hunt_controller.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';
import '/new_code/home_page/HomePage/other_hunters_list.dart';
import '../home_page/HomePage/components/hunters_widget.dart';
import 'outline_button_widget.dart';

class BountyWidget extends StatefulWidget {
  final bounty;
  final Function refreshFeeds;
  const BountyWidget({super.key, this.bounty, required this.refreshFeeds});

  @override
  State<BountyWidget> createState() => _BountyWidgetState();
}

class _BountyWidgetState extends State<BountyWidget> {

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
    var controller = StartHuntController();
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
                  CustomCircleAvatar(
                    imageUrl: widget.bounty.user.photourl,
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  AutoSizeText('${widget.bounty.user.name}',
                      style: FlutterFlowTheme.of(context).bodyLarge),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16.0.w,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3),
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      AutoSizeText(
                      "${DateTimeFormat.relative(
                      relativeTo: DateTime.now(),
                      DateTime.fromMillisecondsSinceEpoch(
                      widget.bounty.expiry * 1000),
                      ifNow: "Just Now..",
                      appendIfAfter: 'ago')} ${DateTime.fromMillisecondsSinceEpoch(widget.bounty.expiry * 1000 ) > DateTime.now() ? "remaining" : "expired"}",
                      style: FlutterFlowTheme.of(context)
                          .labelExtraSmall
                          .override(
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.3)),
                       ),
                    ],
                  ),
                ],
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
              AutoSizeText(
                '${widget.bounty.message}',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Row(
                children: [
                  widget.bounty.tags.isEmpty
                      ? Container()
                      : Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 4.0.w, horizontal: 12.0.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0.w),
                              color: FlutterFlowTheme.of(context).pastelTint),
                          child: AutoSizeText('${widget.bounty.tags[0]}',
                              style: FlutterFlowTheme.of(context)
                                  .labelExtraSmall
                                  .override(
                                      useGoogleFonts: false,
                                      color:
                                          FlutterFlowTheme.of(context).fixedBlack,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                        ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  widget.bounty.tags.length >= 2
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 4.0.w, horizontal: 12.0.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0.w),
                              color: FlutterFlowTheme.of(context).pastelBlue),
                          child: widget.bounty.tags[1] == null
                              ? Container()
                              : AutoSizeText('${widget.bounty.tags[1]}',
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                          useGoogleFonts: false,
                                          color: FlutterFlowTheme.of(context)
                                              .fixedBlack,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400)),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Divider(
                color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
                height: 0.0,
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (widget.bounty.hunters.length != 0) {
                              Get.to(() => OtherHuntersList(
                                    hunters: widget.bounty.hunters,
                                  ));
                            }
                          },
                          child: hunters(widget.bounty.hunters, context)),
                    ],
                  ),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlineButtonWidget(
                          text: "Ignore",
                          onTap: () async {
                            await controller.ignoreBounty(widget.bounty.id);
                            print("Calling refresh callback");
                            await widget.refreshFeeds();
                            showCard();
                            print("Refresh callback executed");
                          },
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        CustomButton(
                          text: "Hunt",
                          onTap: () async {
                            await controller.startBountyHunt(widget.bounty.id);
                            print("Calling refresh callback");
                            await widget.refreshFeeds();
                            showCard();
                            print("Refresh callback executed");
                          },
                        ),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
