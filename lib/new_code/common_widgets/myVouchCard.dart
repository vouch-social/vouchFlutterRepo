import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/vouch_path_list_view.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/update_vouch_status_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/vouch_details_screen.dart';

import '../home_page/history_screen/my_vouch_details_screen.dart';
import 'common_button_widget.dart';
import 'outline_button_widget.dart';
import 'dart:math' as math;

class MyVouchCard extends StatefulWidget {
  final vouch;
  final Function refreshCallBack;
  const MyVouchCard({super.key, this.vouch, required this.refreshCallBack});

  @override
  State<MyVouchCard> createState() => _MyVouchCardState();
}

class _MyVouchCardState extends State<MyVouchCard> {

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
    var controller = UpdateVouchStatusController();
    var revList = widget.vouch.pathData.path.reversed.toList();
    int timestamp = int.parse(widget.vouch.vouchCreatedAt.toString());
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
                  itemCount: widget.vouch.pathData.length,
                  itemBuilder: (context, index) {
                    return vouchPath(context, revList[index], index,
                        widget.vouch.pathData.length, widget.vouch.activenode);
                  },
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              AutoSizeText(
                minFontSize: 0.0,
                '${widget.vouch.message}',
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
                            DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
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
                        widget.vouch.status == 'close' ? Container() :
                        OutlineButtonWidget(text: 'Cancel',
                          onTap: () async{
                            await controller.updateVouchStatus(widget.vouch.id, 'cancel');
                            print("Calling refresh callback...");
                             await widget.refreshCallBack();
                            showCard();
                            print("Refresh callback completed.");
                          },
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        widget. vouch.activenode == widget.vouch.endnode && widget.vouch.status != 'close' && widget.vouch.activenodeStatus != 'pending'?
                        CustomButton(text: 'Connect', onTap: () async{
                          await Get.to(() => MyVouchDetailsScreen(vouch: widget.vouch));
                        },

                        )
                            :
                        widget. vouch.status == 'close' ?
                        AutoSizeText('Closed',
                            style: FlutterFlowTheme.of(context).bodyMedium)
                            :
                        CustomButton(
                          text: "Close",
                          onTap: () async{
                            await controller.updateVouchStatus(widget.vouch.id, 'close');
                            print("Calling refresh callback...");
                            await widget.refreshCallBack();
                            showCard();
                            print("Refresh callback completed.");
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
