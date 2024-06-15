import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/generated/assets.dart';
import '/new_code/common_widgets/common_button_widget.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/common_widgets/outline_button_widget.dart';
import '/new_code/home_page/HomePage/other_hunters_list.dart';
import '/new_code/home_page/history_screen/hunters_list_page.dart';
import '/new_code/home_page/history_screen/my_hunts_hunter_list.dart';
import '../../main.dart';
import '../backend/backend_constants.dart';
import '../home_page/HomePage/components/hunters_widget.dart';
import '../home_page/HomePage/controllers/start_hunt_controller.dart';
import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';

class MyHuntsCard extends StatefulWidget {
  final hunts;
  final Function refreshCallBack;
  const MyHuntsCard({super.key, this.hunts, required this.refreshCallBack});

  @override
  State<MyHuntsCard> createState() => _MyHuntsCardState();
}

class _MyHuntsCardState extends State<MyHuntsCard> {
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
    var statusController = Get.put(UpdateBountyStatusController());
    return Visibility(
      visible: _isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.w),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0.w),
              color: FlutterFlowTheme.of(context).textFieldBackground,
              border: Border.all(
                  color: FlutterFlowTheme.of(context).textFieldBackground)),
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCircleAvatar(
                      imageUrl: widget.hunts.bounty.user.photourl),
                  SizedBox(width: 8.0.w),
                  AutoSizeText('${widget.hunts.bounty.user.name}',
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
                      SizedBox(width: 4.0.w),
                      AutoSizeText(
                        "${DateTimeFormat.relative(relativeTo: DateTime.now(), DateTime.fromMillisecondsSinceEpoch(widget.hunts.bounty.expiry * 1000), ifNow: "Just Now..", appendIfAfter: 'ago ')}${DateTime.fromMillisecondsSinceEpoch(widget.hunts.bounty.expiry * 1000) > DateTime.now() ? " remaining" : "expired"}",
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
              SizedBox(height: 16.0.h),
              AutoSizeText(
                '${widget.hunts.bounty.message}',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 20.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => MyHuntsOtherHuntersList(
                                  hunters: widget.hunts.bounty.hunters,
                                ));
                          },
                          child: hunters(widget.hunts.bounty.hunters, context)),
                    ],
                  ),
                  Spacer(),
                  widget.hunts.hunterStatus == "ignore"
                      ? AutoSizeText("Cancelled",
                          style: FlutterFlowTheme.of(context).buttonText.override(
                              useGoogleFonts: false,
                              fontSize: 12.sp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w400))
                      : widget.hunts.hunterStatus == "claim"
                          ? AutoSizeText('Claimed',
                              style: FlutterFlowTheme.of(context)
                                  .buttonText
                                  .override(
                                      useGoogleFonts: false,
                                      fontSize: 12.sp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w400))
                          : widget.hunts.hunterStatus == "awarded"
                              ? AutoSizeText('Awarded',
                                  style: FlutterFlowTheme.of(context)
                                      .buttonText
                                      .override(
                                          useGoogleFonts: false,
                                          fontSize: 12.sp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w400))
                              : DateTime.fromMillisecondsSinceEpoch(
                                          widget.hunts.bounty.expiry * 1000) >
                                      DateTime.now()
                                  ? Row(
                                      children: [
                                        OutlineButtonWidget(
                                          text: 'Cancel',
                                          onTap: () async {
                                            hideCard();
                                            await statusController
                                                .updateBountyStatus(
                                                    widget.hunts.id,
                                                    'ignore',
                                                    '');
                                            await widget.refreshCallBack();
                                            showCard();
                                          },
                                        ),
                                        SizedBox(width: 8.0.w),
                                        CustomButton(
                                          text: "Claim",
                                          onTap: () async {
                                            showModalBottomSheet(
                                              useSafeArea: true,
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(32.0.w),
                                                  topLeft:
                                                      Radius.circular(32.0.w),
                                                ),
                                              ),
                                              isDismissible: false,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              builder: (BuildContext context) {
                                                return SingleChildScrollView(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 16.0.w,
                                                          right: 16.0.w,
                                                          top: 16.0.w,
                                                          bottom: 28.0.w),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              AutoSizeText(
                                                                "Support your Claim",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                              ),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .cancel_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .ffButton,
                                                                  )),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: 32.0.h),
                                                          TextFormField(
                                                            controller:
                                                                statusController
                                                                    .claimMessageController,
                                                            // autofocus: true,
                                                            minLines: 5,
                                                            maxLines: 8,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .textFieldBackground,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(12.0
                                                                          .w),
                                                              hintText:
                                                                  "Enter your message...",
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8.0
                                                                              .w),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 16.0.h),
                                                          FFButtonWidget(
                                                              text: "Submit",
                                                              onPressed:
                                                                  () async {
                                                                String
                                                                    claimMessage =
                                                                    statusController
                                                                        .claimMessageController
                                                                        .text;
                                                                if (claimMessage ==
                                                                    '') {
                                                                  Get.snackbar(
                                                                      "Alert",
                                                                      "Please write your claim message...");
                                                                } else {
                                                                  hideCard();
                                                                  await statusController.updateBountyStatus(
                                                                      widget
                                                                          .hunts
                                                                          .id,
                                                                      'claim',
                                                                      claimMessage);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  await widget
                                                                      .refreshCallBack();
                                                                  showCard();
                                                                }
                                                              },
                                                              options:
                                                                  CTAButton(
                                                                      context)),
                                                          SizedBox(
                                                            height: 12.0.h,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  : AutoSizeText("Expired",
                                      style: FlutterFlowTheme.of(context)
                                          .buttonText
                                          .override(
                                              useGoogleFonts: false,
                                              fontSize: 12.sp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
