import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/start_hunt_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/other_hunters_list.dart';

import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';
import '../home_page/history_screen/hunters_list_page.dart';
Widget bountyWidget(context, bounty, ){
  var  controller = StartHuntController();
  var statusController = UpdateBountyStatusController();
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 8.0.h),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.w),
            color: FlutterFlowTheme.of(context).textFieldBackground,
        border: Border.all(color: FlutterFlowTheme.of(context).textFieldBackground)
      ),
      padding: EdgeInsets.all(12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCircleAvatar(
                imageUrl: bounty.user.photourl,
              ),
              SizedBox(width: 8.0.w,),
              AutoSizeText(
                '${bounty.user.name}',style: FlutterFlowTheme.of(context).bodyLarge
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.access_time,size: 16.0.w,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),),
                  SizedBox(
                    width: 4.0.w,
                  ),
                  AutoSizeText(
                    DateTimeFormat.relative(
                        relativeTo: DateTime.now(),
                        DateTime.fromMillisecondsSinceEpoch(bounty.expiry*1000),
                        ifNow: "Just Now..",
                        appendIfAfter: 'ago'
                    ),style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3)
                  ),),
                ],
              ),
            ],
          ),
         SizedBox(height: 8.0.h,),
          Divider(
            color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
            height: 0.0,
          ),
          SizedBox(
            height: 8.0.h,
          ),
          AutoSizeText('${bounty.message}',
          style: FlutterFlowTheme.of(context).labelExtraSmall.override(
            useGoogleFonts: false,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,),
          ),
          SizedBox(height: 8.0.h,),
          Row(
            children: [

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 4.0.w,horizontal: 12.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.w),
                    color: FlutterFlowTheme.of(context).pastelTint
                ),
                child:
                bounty.tags.isEmpty ? Container():
                AutoSizeText(
                    '${bounty.tags[0]}',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                        fontSize: 10,
                        fontWeight: FontWeight.w400
                    )
                ),
              ) ,
              SizedBox(width: 8.0.w,),
              bounty.tags.length >= 2 ?
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 4.0.w,horizontal: 12.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.w),
                    color: FlutterFlowTheme.of(context).pastelBlue
                ),
                child:
                bounty.tags[1] == null ? Container():
                AutoSizeText(
                    '${bounty.tags[1]}',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400
                    )
                ),
              ) : Container(),
              // SizedBox(width: 8.0.w,),
              // bounty.tags.length >= 3 ? AutoSizeText("more..",style: FlutterFlowTheme.of(context).labelExtraSmall.override(
              //     useGoogleFonts: false,
              //     color: FlutterFlowTheme.of(context).primaryText,
              //     fontSize: 10.sp,
              //     fontWeight: FontWeight.w400
              // )) : Container()
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
                      onTap: ()
                      {
                        if(bounty.hunters.length != 0){
                          Get.to(() => OtherHuntersList(hunters: bounty.hunters,));
                        }
                      },
                      child: hunters(bounty.hunters,context)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async{
                    await controller.ignoreBounty(bounty.id);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 6.0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: Colors.transparent,
                        border: Border.all(color: FlutterFlowTheme.of(context).primaryText)
                      ),
                      child: AutoSizeText(
                          'Ignore',
                          style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                              useGoogleFonts: false,
                              fontWeight: FontWeight.w400,
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  Obx(
                      () => GestureDetector(
                      onTap: () async{
                        await controller.startBountyHunt(bounty.id);

                      },
                      child: Container(

                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 6.0.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: FlutterFlowTheme.of(context).ffButton,
                        ),
                        child:
                        controller.isLoading.value ? LinearProgressIndicator(
                          minHeight: 4,
                          valueColor: AlwaysStoppedAnimation(FlutterFlowTheme.of(context).primary),
                        ):
                        AutoSizeText(
                             'Hunt',
                            style: FlutterFlowTheme.of(context).buttonText.override(
                                useGoogleFonts: false,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ),
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