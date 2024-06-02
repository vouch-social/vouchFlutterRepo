import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/common_button_widget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/outline_button_widget.dart';
import 'package:vouch/new_code/home_page/HomePage/other_hunters_list.dart';
import 'package:vouch/new_code/home_page/history_screen/hunters_list_page.dart';
import 'package:vouch/new_code/home_page/history_screen/my_hunts_hunter_list.dart';
import '../../main.dart';
import '../backend/backend_constants.dart';
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
  @override
  Widget build(BuildContext context) {
    var statusController = Get.put(UpdateBountyStatusController());
    return Padding(
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
                CustomCircleAvatar(imageUrl: widget.hunts.bounty.user.photourl),
                SizedBox(
                  width: 8.0.w,
                ),
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
                    SizedBox(
                      width: 4.0.w,
                    ),
                    AutoSizeText(
                      DateTimeFormat.relative(
                          relativeTo: DateTime.now(),
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.hunts.bounty.expiry * 1000),
                          ifNow: "Just Now..",
                          appendIfAfter: 'ago'),
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
              height: 16.0.h,
            ),
            AutoSizeText(
              '${widget.hunts.bounty.message}',
              style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
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
                : widget.hunts.hunterStatus == "awarded" ?
                AutoSizeText('Awarded',
                    style: FlutterFlowTheme.of(context)
                        .buttonText
                        .override(
                        useGoogleFonts: false,
                        fontSize: 12.sp,
                        color: FlutterFlowTheme.of(context)
                            .primaryText,
                        fontWeight: FontWeight.w400))
                        : Row(
                            children: [
                              OutlineButtonWidget(
                                text: 'Cancel',
                                onTap: () async {
                                  statusController.updateBountyStatus(
                                      widget.hunts.id, 'ignore', '');
                                  print("Calling refresh callback...");
                                  await widget.refreshCallBack();
                                  print("Refresh callback completed.");
                                },
                              ),
                              SizedBox(
                                width: 8.0.w,
                              ),
                              CustomButton(
                                text: "Claim",
                                onTap: () async {
                                  showModalBottomSheet(
                                    useSafeArea: true,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(32.0.w),
                                        topLeft:  Radius.circular(32.0.w),
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
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.0.w,
                                                right: 16.0.w,
                                                top: 16.0.w,
                                                bottom: 28.0.w),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                          Icons.cancel_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .ffButton,
                                                        )),
                                                  ],
                                                ),

                                                SizedBox(height: 32.0.h),
                                                TextFormField(
                                                  controller: statusController
                                                      .claimMessageController,
                                                  // autofocus: true,
                                                  minLines: 5,
                                                  maxLines: 8,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .textFieldBackground,
                                                    contentPadding:
                                                        EdgeInsets.all(12.0.w),
                                                    hintText:
                                                        "Enter your message...",
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0.w),
                                                        borderSide:
                                                            BorderSide.none),
                                                  ),
                                                ),
                                                SizedBox(height: 16.0.h),
                                                FFButtonWidget(
                                                    text: "Submit",
                                                    onPressed: () async {
                                                      String claimMessage =
                                                          statusController
                                                              .claimMessageController
                                                              .text;
                                                      if (claimMessage == '') {
                                                        Get.snackbar("Alert",
                                                            "Please write your claim message...");
                                                      } else {
                                                        await statusController
                                                            .updateBountyStatus(
                                                                widget.hunts.id,
                                                                'claim',
                                                                claimMessage);
                                                        Navigator.of(context)
                                                            .pop();
                                                        print(
                                                            "Calling refresh callback...");
                                                        await widget
                                                            .refreshCallBack();
                                                        print(
                                                            "Refresh callback completed.");
                                                      }
                                                    },
                                                    options:
                                                        CTAButton(context)),
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
                          ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget hunters(hunters, context) {
  if (hunters.length == 0) {
    return SizedBox(
      width: 100,
      height: 24,
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
          width: 48,
          height: 24,
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
                      left: 12,
                      child: CustomCircleAvatar(
                        imageUrl: hunters[1].user.photourl,
                        radius: 12.0.w,
                      ))
                  : Container(),
              hunters.length >= 3
                  ? Positioned(
                      left: 24,
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
          width: 120,
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
