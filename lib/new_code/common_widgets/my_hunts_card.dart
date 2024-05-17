import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/HomePage/other_hunters_list.dart';
import 'package:vouch/new_code/home_page/history_screen/hunters_list_page.dart';
import 'package:vouch/new_code/home_page/history_screen/my_hunts_hunter_list.dart';
import '../../main.dart';
import '../backend/backend_constants.dart';
import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';

Widget myHuntsWidget(context, hunts) {
  print(hunts.id);
  var statusController = UpdateBountyStatusController();
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
              CustomCircleAvatar(imageUrl: hunts.bounty.user.photourl),
              SizedBox(
                width: 8.0.w,
              ),
              AutoSizeText('${hunts.bounty.user.name}',
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
                        DateTime.fromMillisecondsSinceEpoch(hunts.bounty.expiry*1000),
                        ifNow: "Just Now..",
                        appendIfAfter: 'ago'
                    ),
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
            '${hunts.bounty.message}',
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
                      onTap: (){
                        Get.to(() => MyHuntsOtherHuntersList(hunters: hunts.bounty.hunters,));
                      },
                      child: hunters(hunts.bounty.hunters,context)),
                ],
              ),
              //Spacer(),
              SizedBox(
                width: 8.0.w,
              ),
              hunts.hunterStatus != "claim"?
              GestureDetector(
                onTap: (){
                  statusController.updateBountyStatus(hunts.id, 'claim');
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
                  child: AutoSizeText('Claim',
                      style: FlutterFlowTheme.of(context).buttonText.override(
                          useGoogleFonts: false,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ),
              ):
              AutoSizeText('Claimed',
                  style: FlutterFlowTheme.of(context).buttonText.override(
                      useGoogleFonts: false,
                      fontSize: 12.sp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w400)),
            ],
          )
        ],
      ),
    ),
  );
}


Widget hunters(hunters,context) {
  if (hunters.length == 0) {
    return SizedBox(
      width: 100,
      height: 24,
      child: AutoSizeText("Nobody is hunting", minFontSize: 0.0,
        style: FlutterFlowTheme
            .of(context)
            .bodyLarge
            .override(
            useGoogleFonts: false,
            color: FlutterFlowTheme
                .of(context)
                .primaryText
                .withOpacity(0.5),
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
              hunters.length >= 1 ?
              Positioned(
                left: 0,
                child: CircleAvatar(
                    radius: 12.0.w,
                    backgroundColor: Colors.transparent,
                    child:
                    hunters[0].user.photourl != null && hunters[0].user.photourl.startsWith('http')
                        ? Image.network(hunters[0].user.photourl)
                        :Image.asset(Assets.assetsImage951)
                ),
              ) : Container(),
              hunters.length >= 2 ?
              Positioned(
                left: 12,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 12.0.w,
                    child: hunters[1].user.photourl != null && hunters[1].user.photourl.startsWith('http')
                        ? Image.network(hunters[1].user.photourl)
                    // : hunters[1].user.photourl != null
                        : Image.asset(Assets.assetsImage951)
                ),
              ) : Container(),
              hunters.length >= 3 ?
              Positioned(
                left: 24,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 12.0.w,
                    child:
                    hunters[1].user.photourl != null && hunters[1].user.photourl.startsWith('http')
                        ? Image.network(hunters[2].user.photourl)
                        : Image.asset(Assets.assetsImage951)
                ),
              ) : Container()
            ],
          ),
        ),
        SizedBox(width: 8.0.w,),
        SizedBox(
          //padding: EdgeInsets.only(right: 24),
          width: 120,
          child: AutoSizeText(
            hunters.length == 1 ?
            '${getFirstName(hunters[0].user.name)} is hunting' :
            hunters.length == 2 ?
            '${getFirstName(hunters[0].user.name)} & ${getFirstName(hunters[1].user.name)} are hunting' :
            hunters.length >= 3 ?
            '${getFirstName(hunters[0].user.name)}, ${getFirstName(hunters[1].user.name)} & ${hunters.length-2} more are hunting':"",
            minFontSize: 0.0,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                useGoogleFonts: false,
                color: FlutterFlowTheme.of(context)
                    .primaryText
                    .withOpacity(0.5),
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