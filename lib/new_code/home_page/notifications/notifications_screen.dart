import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/history_screen/history.dart';
import 'package:vouch/new_code/home_page/notifications/notification_controller.dart';
import 'package:vouch/new_code/home_page/settings/attributes_validation/attributes_validation.dart';
import 'dart:async';

import '../../services/notification_services.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var notificationsData;
  final controller = Get.put(NotificationsController());
  Timer? _timer;
  NotificationServices notificationServices = NotificationServices();

  void _initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await fetchNotifications();
    });
  }

  Future<void> fetchNotifications() async {
    var fetchedNotifications = await controller.getTotalNotifications();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        notificationsData = fetchedNotifications.notificationData;
      });
    });
  }

  @override
  void initState() {
    _initializeData();
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 15), _stopTimer);
  }

  void _stopTimer() {
    _timer?.cancel();
    print("Timer stopped after 15 seconds");
    controller.allNotificationsSeen();
    notificationServices.resetBadgeCount();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar:  const CustomAppBar(
        showNotificationButton: false,
        showBackButton: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await fetchNotifications();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: FlutterFlowTheme.of(context).primaryBackground,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0.w, bottom: 16.0.w),
                  child: AutoSizeText(
                    "Notifications",
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ),
              notificationsData != null
                  ? (notificationsData.isNotEmpty)
                  ? Expanded(
                child: ListView.builder(
                  itemCount: notificationsData.length,
                  itemBuilder: (context, index) {
                    var notifications = notificationsData[index];
                    return GestureDetector(
                      onTap: () async{
                        if(notifications.status != 'seen'){
                         await controller.singleNotificationSeen(notifications.id);
                        }
                        notifications.notificationType ==
                            "VOUCH_COMPLETED"
                            ? Get.to(() => const HistoryScreen(
                          index: 1,
                        ))
                            : notifications.notificationType ==
                            "BOUNTY_HUNTED" || notifications.notificationType == "BOUNTY_CLAIMED"
                            ? Get.to(() => const HistoryScreen(
                          index: 0,
                        ))
                            : notifications.notificationType ==
                            "CLAIM_AWARDED"
                            ? Get.to(
                                () => const HistoryScreen(
                              index: 2,
                            ))
                            : notifications.notificationType ==
                            "ATTR_VALIDATION" ? Get.to(() => const AttributesValidation()) : Get.to(
                                () => const NewHomePage());

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: notifications.status == 'seen' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context)
                                .textFieldBackground ,
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                    FlutterFlowTheme.of(context)
                                        .primaryText
                                        .withOpacity(0.2)))),
                        child: ListTile(
                          tileColor: notifications.status == 'seen' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context)
                              .textFieldBackground ,
                          leading: CustomCircleAvatar(
                            imageUrl: 'jfnjsnjnsa',
                            radius: 24.0.w,
                          ),
                          title: AutoSizeText(notifications.title,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall),
                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0.h),
                              SizedBox(
                                width: 144.0.w,
                                child: AutoSizeText(
                                    notifications.description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                    FlutterFlowTheme.of(context)
                                        .labelExtraSmall),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 120.0.w,
                            child: Row(
                              children: [
                                const Spacer(),
                                Icon(Icons.access_time,
                                    size: 16.0.w,
                                    color:
                                    FlutterFlowTheme.of(context)
                                        .primaryText
                                        .withOpacity(0.5)),
                                SizedBox(width: 4.0.w),
                                AutoSizeText(
                                  DateTimeFormat.relative(
                                      relativeTo: DateTime.now(),
                                      DateTime
                                          .fromMillisecondsSinceEpoch(
                                          notifications
                                              .createdAt *
                                              1000),
                                      ifNow: "Just Now..",
                                      appendIfAfter: 'ago...'),
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                      useGoogleFonts: false,
                                      fontWeight: FontWeight.w400,
                                      color: FlutterFlowTheme.of(
                                          context)
                                          .primaryText
                                          .withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 280.0.h,
                    ),
                    AutoSizeText(
                      "No Notifications Yet!",
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
              )
                  : Column(
                children: [
                  SizedBox(
                    height: 280.0.h,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
