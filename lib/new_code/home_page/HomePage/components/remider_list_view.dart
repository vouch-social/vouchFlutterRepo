
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class RemindersListView extends StatelessWidget {
  //final List<String> items = List.generate(3, (index) => 'Item $index');

  const RemindersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> reminderColors = [
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.w),
                    ),
                    child: Image.asset('assets/image951.png'),
                  ),
                  SizedBox(width: 16.0.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText("Find Camera repairman",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context).bodyLarge),
                      SizedBox(height: 4.h),
                      AutoSizeText(
                        "Shantanu accepted vouch request",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Bricolage Grotesque',
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16.0.h,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3),
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      AutoSizeText(
                        '10:10 AM',
                        style: FlutterFlowTheme.of(context)
                            .labelExtraSmall
                            .override(
                          useGoogleFonts: false,
                          color: FlutterFlowTheme.of(context)
                              .primaryText
                              .withOpacity(0.3),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: FlutterFlowTheme.of(context).border2,
          thickness: 1.sp,
        );
      },
      itemCount: 2,
    );
  }
}
