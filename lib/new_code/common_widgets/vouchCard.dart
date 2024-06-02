import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vouch/new_code/backend/models/paths_model.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/common_button_widget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/accept_vouch_controller.dart';

import '../home_page/HomePage/controllers/update_vouch_status_controller.dart';
import '../home_page/HomePage/vouch_details_screen.dart';
import 'outline_button_widget.dart';


class FeedsVouchCard extends StatefulWidget {
  final feedModelVouch;
  final Function refreshFeeds;
  const FeedsVouchCard({super.key, this.feedModelVouch, required this.refreshFeeds});

  @override
  State<FeedsVouchCard> createState() => _FeedsVouchCardState();
}

class _FeedsVouchCardState extends State<FeedsVouchCard> {
  var controller = AcceptVouchController();
  var statusController = UpdateVouchStatusController();
  @override
  Widget build(BuildContext context) {
    int timestamp = int.parse(widget.feedModelVouch.vouchCreatedAt.toString());
    var revList = widget.feedModelVouch.pathData.path.reversed.toList();
    return Padding(
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
                  return vouchPath(context, revList[index], index,
                      widget.feedModelVouch.pathData.length, widget.feedModelVouch.activenode);
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
                    OutlineButtonWidget(
                      text: 'Ignore',
                      onTap: () async{
                        await controller.sendVouchStatus(widget.feedModelVouch.id, "reject");
                        print("Calling refresh callback");
                        await widget.refreshFeeds();
                        print("Refresh callback executed");
                      },
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    widget.feedModelVouch.activenodeStatus == 'accept' &&
                        widget.feedModelVouch.activenode == widget.feedModelVouch.endnode
                        ?  CustomButton(
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
                        : CustomButton(text: 'Vouch',  onTap: () async {
                      await controller.sendVouchStatus(
                          widget.feedModelVouch.id, "accept");
                      print("Calling refresh callback");
                      await widget.refreshFeeds();
                      print("Refresh callback executed");
                    },),

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

Widget vouchPath(context, pathItem, index, length, activenode) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          CircleAvatar(
              radius: 22.0.h,
              backgroundColor: activenode == pathItem.contactHashedPhone
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.transparent,
              child: CustomCircleAvatar(
                radius: 20.0.w,
                imageUrl: pathItem.image!,
              )),
          SizedBox(height: 4.0.h),
          SizedBox(
            width: 64.w,
            child: AutoSizeText(
              '${pathItem.name}',
              overflow: TextOverflow.ellipsis,
              minFontSize: 10.0,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    fontSize: 10.sp,
                  ),
            ),
          ),
          // Spacer(),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.w),
        child: Visibility(
          visible: index != length - 1 ? true : false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 4.0.h,
                width: (MediaQuery.of(context).size.width -
                        56.0.w -
                        (length * 64.0.h)) /
                    (length - 1),
                color: index == length - 2
                    ? FlutterFlowTheme.of(context).primary
                    : (pathItem.hasVouched
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
