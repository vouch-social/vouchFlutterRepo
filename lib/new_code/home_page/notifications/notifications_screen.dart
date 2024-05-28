import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: const CustomAppBar(
        showNotificationButton: false,
        showBackButton: true,
        title: "Notifications",
      ),
      body: SafeArea(
        child: ListView.builder(

          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              color: FlutterFlowTheme.of(context).pastelTint,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 16.0.w),
                    tileColor: FlutterFlowTheme.of(context).pastelTint,
                    leading: CustomCircleAvatar(
                      imageUrl: 'jfnjsnjnsa',
                      radius: 30.0.w,
                    ),
                    title: AutoSizeText(
                      "Chitranjan Rao",
                      style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0.h),
                        SizedBox(
                          width: 144.0.w,
                          child: AutoSizeText(
                            "Product, Strategy Leader | Serial Ent...",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                              useGoogleFonts: false,
                              color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16.0.w,
                              color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(0.5)                        ),
                          SizedBox(width: 4.0.w),
                          AutoSizeText(
                            DateTimeFormat.relative(
                                relativeTo: DateTime.now(),
                                DateTime.fromMillisecondsSinceEpoch(40),
                                ifNow: "Just Now..",
                                appendIfAfter: 'ago...'
                            ),
                            style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                              useGoogleFonts: false,
                              fontWeight: FontWeight.w400,
                                color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(0.5)                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
