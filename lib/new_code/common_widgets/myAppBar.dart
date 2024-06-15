import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/new_code/home_page/history_screen/history.dart';
import '/new_code/common_widgets/vector.dart';
import '/new_code/home_page/notifications/notifications_screen.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../generated/assets.dart';
import '../home_page/settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showProfileButton;
  final String title;
  final Color backgroundColor;
  final bool showHistoryButton;
  final bool showNotificationButton;
  final Function()? onSettingsButtonPressed;
  final Function()? onBackButtonPressed; // New optional parameter

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.title = "",
    this.backgroundColor = Colors.transparent,
    this.showProfileButton = true,
    this.onSettingsButtonPressed,
    this.showHistoryButton = true,
    this.showNotificationButton = true,
    this.onBackButtonPressed, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor == Colors.transparent
          ? FlutterFlowTheme.of(context).primaryBackground
          : backgroundColor,
      elevation: 0,
      leading: showBackButton
          ? GestureDetector(
              onTap: onBackButtonPressed ??
                  () {
                    Get.back();
                  },
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.arrow_back,
                      color: FlutterFlowTheme.of(context)
                          .alternate), // Replace with your icon
                ),
              ),
            )
          : Container(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: FlutterFlowTheme.of(context).headlineLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              showNotificationButton
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const NotificationsScreen(),
                          transition: Transition.upToDown,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(8.0.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: FlutterFlowTheme.of(context).alternate,
                          )),
                    )
                  : Container(),
              showHistoryButton
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const HistoryScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(8.0.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.history_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                          )),
                    )
                  : Container(),
              showProfileButton
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const SettingsScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(8.0.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            Assets.assetsUserIcon,
                            height: 20.h,
                            width: 20.w,
                            color: FlutterFlowTheme.of(context).alternate,
                          )),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
