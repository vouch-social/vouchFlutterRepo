import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/home_page/history_screen/hunters_list_page.dart';
import 'package:vouch/new_code/home_page/history_screen/update_bounty_by_id_controller.dart';

import '../../main.dart';
import '../backend/backend_constants.dart';
import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';

Widget myBountyWidget(context, bounty) {
  var controller = UpdateBountyByIdController();
  print(bounty.expiry);
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
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20.0.w,
                child: prefs!.getString(imageUrl) != 'null'
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        Assets.assetsImage951,
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(
                width: 8.0.w,
              ),
              AutoSizeText('${prefs!.getString(userName)}',
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
                            bounty.expiry * 1000),
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
            '${bounty.message}',
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
                        if (bounty.hunters.length != 0) {
                          Get.to(() => HuntersListScreen(
                                hunters: bounty.hunters,
                              ));
                        }
                      },
                      child: hunters(bounty.hunters, context)),
                ],
              ),
              //Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  bounty.hunters.length == 0
                      ? GestureDetector(
                          onTap: () {
                            controller.updateBountyById(bounty.id, 'open',2);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0.w, vertical: 6.0.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0.w),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText)),
                            child: AutoSizeText('Close',
                                style: FlutterFlowTheme.of(context)
                                    .labelExtraSmall
                                    .override(
                                      useGoogleFonts: false,
                                      fontWeight: FontWeight.w400,
                                    )),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.updateBountyById(bounty.id, 'close',0);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0.w, vertical: 6.0.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0.w),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText)),
                            child: AutoSizeText('Close',
                                style: FlutterFlowTheme.of(context)
                                    .labelExtraSmall
                                    .override(
                                      useGoogleFonts: false,
                                      fontWeight: FontWeight.w400,
                                    )),
                          ),
                        ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // statusController.updateBountyStatus(bounty.id, 'awarded');
                    },
                    child: Container(
                      //height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 6.0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: FlutterFlowTheme.of(context).ffButton,
                          border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground)),
                      child: AutoSizeText('Award',
                          style: FlutterFlowTheme.of(context)
                              .buttonText
                              .override(
                                  useGoogleFonts: false,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400)),
                    ),
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

Widget hunters(hunters, context) {
  if (hunters.length == 0) {
    return SizedBox(
      width: 48,
      height: 24,
      child: AutoSizeText(
        "Nobody is hunting",
        minFontSize: 0.0,
        style: FlutterFlowTheme.of(context).bodyLarge.override(
            useGoogleFonts: false,
            color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
            fontSize: 8.0,
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
                      child: CircleAvatar(
                          radius: 12.0.w,
                          backgroundColor: Colors.transparent,
                          child: hunters[0].user.photourl != null &&
                                  hunters[0].user.photourl.startsWith('http')
                              ? Image.network(hunters[0].user.photourl)
                              : Image.asset(Assets.assetsImage951)),
                    )
                  : Container(),
              hunters.length >= 2
                  ? Positioned(
                      left: 12,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 12.0.w,
                          child: hunters[1].user.photourl != null &&
                                  hunters[1].user.photourl.startsWith('http')
                              ? Image.network(hunters[1].user.photourl)
                              // : hunters[1].user.photourl != null
                              : Image.asset(Assets.assetsImage951)),
                    )
                  : Container(),
              hunters.length >= 3
                  ? Positioned(
                      left: 24,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 12.0.w,
                          child: hunters[1].user.photourl != null &&
                                  hunters[1].user.photourl.startsWith('http')
                              ? Image.network(hunters[2].user.photourl)
                              : Image.asset(Assets.assetsImage951)),
                    )
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
