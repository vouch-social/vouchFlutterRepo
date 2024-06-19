import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/outline_button_widget.dart';
import 'package:vouch/new_code/home_page/history_screen/hunters_list_page.dart';
import 'package:vouch/new_code/home_page/history_screen/update_bounty_by_id_controller.dart';

import '../../main.dart';
import '../backend/backend_constants.dart';
import '../home_page/HomePage/components/hunters_widget.dart';
import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';
import '../home_page/history_screen/bounty_details_by_id.dart';
import 'common_button_widget.dart';

class MyBountyWidget extends StatefulWidget {
  final bounty;
  final Function refreshCallback;
  const MyBountyWidget({super.key, this.bounty, required this.refreshCallback, });

  @override
  State<MyBountyWidget> createState() => _MyBountyWidgetState();
}

class _MyBountyWidgetState extends State<MyBountyWidget> {
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
    var controller = UpdateBountyByIdController();
    print(widget.bounty.expiry);
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
                    radius: 20.0.w,
                    imageUrl: prefs!.getString(imageUrl),
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  Expanded(
                    child: AutoSizeText('${prefs!.getString(userName)}',
                        minFontSize: 14.0,
                        style: FlutterFlowTheme.of(context).bodyLarge),
                  ),
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
                          appendIfAfter: 'ago',
                        )} ${DateTime.fromMillisecondsSinceEpoch(widget.bounty.expiry * 1000 ) > DateTime.now() ? "remaining" : "expired"} ",
                        minFontSize: 8,
                        overflow: TextOverflow.ellipsis,
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
                '${widget.bounty.message}',
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
                            if (widget.bounty.hunters.length != 0) {
                              Get.to(() => BountyDetailsScreen(
                                bounty: widget.bounty,
                              ));
                            }
                          },
                          child: hunters(widget.bounty.hunters, context)),
                    ],
                  ),
                  //Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.bounty.bountyStatus == 'close'
                          ? AutoSizeText("Closed",
                          style: FlutterFlowTheme.of(context).bodyMedium)
                          : OutlineButtonWidget(
                        text: 'Close',
                        onTap: () async {
                          await controller.updateBountyById(widget.bounty.id, 'close', 0);
                          print("Calling refresh callback...");
                          await widget.refreshCallback();
                          showCard();
                          print("Refresh callback completed.");
                        },
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      widget.bounty.bountyStatus == 'close'
                          ? Container()
                          : widget.bounty.hunters.length == 0
                          ? CustomButton(
                        text: "Extend",
                        onTap: () async {
                          await controller.updateBountyById(
                              widget.bounty.id, 'open', 2);
                          print("Calling refresh callback...");
                          await widget.refreshCallback();
                          showCard();
                          print("Refresh callback completed.");
                        },
                      )
                          : CustomButton(
                        text: "Award",
                        onTap: () {
                          Get.to(() => BountyDetailsScreen(
                            bounty: widget.bounty,
                          ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
