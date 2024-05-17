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
import 'package:vouch/new_code/home_page/HomePage/controllers/update_vouch_status_controller.dart';

Widget myVouchWidget(context, vouch) {

  var controller = UpdateVouchStatusController();
  var revList = vouch.pathData.path.reversed.toList();
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
              itemCount: vouch.pathData.length,
              itemBuilder: (context, index) {
                return vouchPath(context, revList[index], index,
                    vouch.pathData.length, vouch.activenode);
              },
            ),
          ),
          SizedBox(
            height: 16.0.h,
          ),
          AutoSizeText(
            minFontSize: 0.0,
            '${vouch.message}',
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
                        DateTime.now().subtract(Duration(minutes: 50)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  vouch.status == 'close' ? Container() :
                  GestureDetector(
                    onTap: () async{
                      await controller.updateVouchStatus(vouch.id, 'cancel');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 6.0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: Colors.transparent,
                          border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText)),
                      child: AutoSizeText('Cancel',
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
                  vouch.activenode == vouch.endnode && vouch.status != 'close' && vouch.activenodeStatus != 'pending'?
                  GestureDetector(
                    onTap: () async{
                      //await controller.updateVouchStatus(vouch.id, 'close');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 8.0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: FlutterFlowTheme.of(context).primary),
                      child: AutoSizeText('Connect',
                          style: FlutterFlowTheme.of(context).buttonText.override(
                              useGoogleFonts: false,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                      :
                  vouch.status == 'close' ?
                  AutoSizeText('Closed',
                      style: FlutterFlowTheme.of(context).bodyMedium)
                      :
                  GestureDetector(
                    onTap: () async{
                      await controller.updateVouchStatus(vouch.id, 'close');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 8.0.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0.w),
                          color: FlutterFlowTheme.of(context).primary),
                      child: AutoSizeText('Close',
                          style: FlutterFlowTheme.of(context).buttonText.override(
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

Widget vouchPath(context, pathItem, index, length, activenode) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          CircleAvatar(
            radius: 22.0.h,
            backgroundColor: activenode == pathItem.contactHashedPhone ? FlutterFlowTheme.of(context).primary:Colors.transparent,
            child: CircleAvatar(
              radius: 20.0.h,
              backgroundColor: Colors.transparent,
             backgroundImage:


             pathItem.image != null && pathItem.image.toString().contains('http')
                 ? NetworkImage(pathItem.image.toString())
                 : pathItem.image is ImageProvider
                 ? pathItem.image as ImageProvider<Object>
                 : AssetImage('assets/image951.png'),
              ),
            ),

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
      Visibility(
        visible: index != length-1 ? true : false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0.w),
              child: Container(
                  height: 4.0.h,
                  width: (MediaQuery.of(context).size.width -
                      56.0.w -
                      (length * 64.0.h)) /
                      (length - 1),
                  color: pathItem.hasVouched
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),),
            ),
          ],
        ),
      ),
    ],
  );
}
