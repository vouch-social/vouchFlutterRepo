import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vouch/new_code/backend/models/paths_model.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
Widget feedsVouchWidget(context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.w),
        color: FlutterFlowTheme.of(context).primaryBackground,
        border: Border.all(color: FlutterFlowTheme.of(context).textFieldBackground)
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 76,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            //shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0.w),
                              ),
                              child: CircleAvatar(
                                //backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/image951.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: index != 3 ? true : false,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      height: 4.0.h,
                                      width: 56.0.w,
                                      color: index == 0
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                          .primaryText
                                          .withOpacity(0.3)),
                                  Visibility(
                                    visible: index == 0 ? true : false,
                                    child: SvgPicture.asset(
                                      "assets/check_vouch_svg.svg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0.h),
                        SizedBox(
                          width: 40.w,
                          child: AutoSizeText(
                            'Samar Reddy',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelExtraSmall
                                .override(
                              useGoogleFonts: false,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        AutoSizeText(
          minFontSize: 0.0,
          'Want to Connect with IT company CEO for business consulting and services. Want to Connect with IT company CEO for business consulting and services.',
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
                  color:
                  FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
                ),
                SizedBox(
                  width: 4.0.w,
                ),
                AutoSizeText(
                  DateTimeFormat.relative(
                      DateTime.now().subtract(Duration(minutes: 50)),
                      ifNow: "Just Now..",
                      appendIfAfter: 'ago'
                  )
                  ,
                  style: FlutterFlowTheme.of(context).labelExtraSmall.override(
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
                Container(
                  alignment: Alignment.center,
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.w),
                      color: Colors.transparent,
                      border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText)),
                  child: AutoSizeText('Ignore',
                      style:
                      FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        fontWeight: FontWeight.w400,
                      )),
                ),

                SizedBox(
                  width: 8.0.w,
                ),

                Container(
                  alignment: Alignment.center,
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.w),
                      color: FlutterFlowTheme.of(context).ffButton),
                  child: AutoSizeText('Vouch',
                      style: FlutterFlowTheme.of(context)
                          .buttonText.override(
                          useGoogleFonts: false,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ),


              ],
            ),
          ],
        )
      ],
    ),
  );
}
