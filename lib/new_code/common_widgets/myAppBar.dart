import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/history_screen/history.dart';
import 'package:vouch/new_code/common_widgets/vector.dart';
import 'package:vouch/new_code/home_page/notifications/notifications_screen.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import '../home_page/settings/settings_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showProfileButton;
  final String title;
  final Color backgroundColor;
  final bool showHistoryButton;
  final bool showNotificationButton;
  final Function()? onSettingsButtonPressed;
  final Function()? onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    this.showBackButton = false,
    this.title = "",
    this.backgroundColor = Colors.transparent,
    this.showProfileButton = true,
    this.onSettingsButtonPressed,
    this.showHistoryButton = true,
    this.showNotificationButton = true,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
   int _cartBadgeAmount = 0;
  late bool _showCartBadge;

   Future<void> fecthCount() async {
     var fetchedCount = prefs?.getInt('badgeCount') ?? 0;
     WidgetsBinding.instance.addPostFrameCallback((_) {
       if (!mounted) return;
       setState(() {
         _cartBadgeAmount = fetchedCount;
       });
     });
   }

  @override
  void initState() {
    super.initState();
    notificationServices.initLocalNotifications();
    notificationServices.setupInteractMessage(context);
    fecthCount();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor == Colors.transparent
          ? FlutterFlowTheme.of(context).primaryBackground
          : widget.backgroundColor,
      elevation: 0,
      leading: widget.showBackButton
          ? GestureDetector(
              onTap: widget.onBackButtonPressed ??
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
                      color: FlutterFlowTheme.of(context).alternate),
                ),
              ),
            )
          : Container(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: FlutterFlowTheme.of(context).headlineLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.showNotificationButton
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const NotificationsScreen(),
                          transition: Transition.upToDown,
                          duration: const Duration(milliseconds: 500),
                        );
                        notificationServices.resetBadgeCount();
                        setState(() {
                          _cartBadgeAmount = 0;
                        });
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        padding: EdgeInsets.all(8.0.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Badge(
                          alignment: Alignment.topRight,
                          isLabelVisible: _cartBadgeAmount > 0,
                          label: Text(
                            _cartBadgeAmount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              widget.showHistoryButton
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
                        ),
                      ),
                    )
                  : Container(),
              widget.showProfileButton
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
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
