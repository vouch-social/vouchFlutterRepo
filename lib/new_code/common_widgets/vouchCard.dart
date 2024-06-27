import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/common_button_widget.dart';
import 'package:vouch/new_code/common_widgets/vouch_path_list_view.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/accept_vouch_controller.dart';
import '../home_page/HomePage/controllers/update_vouch_status_controller.dart';
import '../home_page/HomePage/vouch_details_screen.dart';
import 'outline_button_widget.dart';

class FeedsVouchCard extends StatefulWidget {
  final feedModelVouch;
  final Function refreshFeeds;
  const FeedsVouchCard(
      {super.key, this.feedModelVouch, required this.refreshFeeds});

  @override
  State<FeedsVouchCard> createState() => _FeedsVouchCardState();
}

class _FeedsVouchCardState extends State<FeedsVouchCard> {
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

  var controller = AcceptVouchController();
  var statusController = UpdateVouchStatusController();
  @override
  Widget build(BuildContext context) {
    int timestamp = int.parse(widget.feedModelVouch.vouchCreatedAt.toString());
    var revList = widget.feedModelVouch.pathData.path.reversed.toList();
    return Visibility(
      visible: _isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0.w),
              color: FlutterFlowTheme.of(context).textFieldBackground,
              border: Border.all(
                  color: FlutterFlowTheme.of(context).textFieldBackground)),
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 76.0.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.feedModelVouch.pathData.length,
                  itemBuilder: (context, index) {
                    return vouchPath(
                        context,
                        revList[index],
                        index,
                        widget.feedModelVouch.pathData.length,
                        widget.feedModelVouch.activenode);
                  },
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              AutoSizeText(
                minFontSize: 0.0,
                '${widget.feedModelVouch.message}',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                                timestamp * 1000),
                            ifNow: "Just Now..",
                            appendIfAfter: 'ago...'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlineButtonWidget(
                        text: 'Ignore',
                        onTap: () async {
                          await controller.sendVouchStatus(
                              widget.feedModelVouch.id, "reject");
                          print("Calling refresh callback");
                          await widget.refreshFeeds();
                          showCard();
                          print("Refresh callback executed");
                        },
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      widget.feedModelVouch.activenodeStatus == 'accept' &&
                              widget.feedModelVouch.activenode ==
                                  widget.feedModelVouch.endnode
                          ? CustomButton(
                              text: "Connect",
                              onTap: () async {
                                await Get.to(() => VouchDetailsScreen(
                                      vouch: widget.feedModelVouch,
                                    ));
                                print("Calling refresh callback");
                                await widget.refreshFeeds();
                                print("Refresh callback executed");
                              },
                            )
                          : widget.feedModelVouch.activenode ==
                                  widget.feedModelVouch.endnode
                              ? CustomButton(
                                  text: 'Accept',
                                  onTap: () async {
                                    await controller.sendVouchStatus(
                                        widget.feedModelVouch.id, "accept");
                                    print("Calling refresh callback");
                                    showCard();
                                    await widget.refreshFeeds();
                                    print("Refresh callback executed");
                                  },
                                )
                              : CustomButton(
                                  text: 'Vouch',
                                  onTap: () async {
                                    await controller.sendVouchStatus(
                                        widget.feedModelVouch.id, "accept");
                                    print("Calling refresh callback");
                                    showCard();
                                    await widget.refreshFeeds();
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
