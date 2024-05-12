import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../generated/assets.dart';
import '../../common_widgets/myAppBar.dart';

class BountyDetailsScreen extends StatefulWidget {
  final hunters;
  const BountyDetailsScreen({super.key, this.hunters});

  @override
  State<BountyDetailsScreen> createState() => _BountyDetailsScreenState();
}

class _BountyDetailsScreenState extends State<BountyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                SizedBox(
                  height: 8.0.h,
                ),
                AutoSizeText(
                  "Your Bounty",
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                Container(
                  padding: EdgeInsets.all(16.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0.w),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      border: Border.all(
                          color: FlutterFlowTheme.of(context)
                              .textFieldBackground)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/image951.png'),
                            radius: 18.0.w,
                          ),
                          SizedBox(
                            width: 8.0.w,
                          ),
                          AutoSizeText(
                            'Samarth Reddy',
                            style: FlutterFlowTheme.of(context).labelSmall,
                          ),
                          const Spacer(),
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
                                DateTime.fromMillisecondsSinceEpoch(10),
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
                      SizedBox(height: 16.0.h,),
                      AutoSizeText('Want to find driver for car delivery, Want to find driver for car delivery.',
                      style: FlutterFlowTheme.of(context).labelExtraSmall,
                      ),
                      SizedBox(
                        height: 12.0.h,
                      ),
                      Container(
                        color: FlutterFlowTheme.of(context).textFieldBackground,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16.0.w,
                              color: FlutterFlowTheme.of(context)
                                  .primaryText
                                  .withOpacity(0.3),
                            ),
                            SizedBox(
                              width: 8.0.w,
                            ),
                            AutoSizeText('Need to be completed within 24 hours.',
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.hunters.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.0.h),
                                child: ListTile(
                                  minVerticalPadding: 4.0.h,
                                  tileColor:
                                  FlutterFlowTheme.of(context).textFieldBackground,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0.w)),
                                  leading:
                                  widget.hunters[index].user.photourl != null &&
                                      widget.hunters[index].user.photourl
                                          .startsWith('http')
                                      ? Image.network(
                                      widget.hunters[index].user.photourl)
                                      : Image.asset(Assets.assetsImage951),
                                  title: AutoSizeText(
                                    widget.hunters[index].user.name,
                                    style: FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  subtitle: AutoSizeText(
                                    widget.hunters[index].user.localizedheadline,
                                    style: FlutterFlowTheme.of(context).labelExtraSmall,
                                  ),
                                  trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.0.h, horizontal: 10.0.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0.w),
                                        border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText)),
                                    child: AutoSizeText(
                                      "Award",
                                      minFontSize: 8,
                                      style: FlutterFlowTheme.of(context)
                                          .labelExtraSmall
                                          .override(
                                          useGoogleFonts: false,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),

                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.hunters.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.0.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0.w),
                                      border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .textFieldBackground,
                                          width: 1)),
                                  child: ListTile(
                                    minVerticalPadding: 4.0.h,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0.w),
                                    ),
                                    leading:
                                    widget.hunters[index].user.photourl != null &&
                                        widget.hunters[index].user.photourl
                                            .startsWith('http')
                                        ? Image.network(
                                        widget.hunters[index].user.photourl)
                                        : Image.asset(Assets.assetsImage951),
                                    title: AutoSizeText(
                                      widget.hunters[index].user.name,
                                      style: FlutterFlowTheme.of(context).titleSmall,
                                    ),
                                    subtitle: AutoSizeText(
                                      widget.hunters[index].user.localizedheadline,
                                      style:
                                      FlutterFlowTheme.of(context).labelExtraSmall,
                                    ),
                                    trailing: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.0.h, horizontal: 10.0.w),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0.w),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText
                                                .withOpacity(0.2),
                                          )),
                                      child: AutoSizeText(
                                        "Awarded",
                                        minFontSize: 8,
                                        style: FlutterFlowTheme.of(context)
                                            .labelExtraSmall
                                            .override(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText
                                                .withOpacity(0.2),
                                            useGoogleFonts: false,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
