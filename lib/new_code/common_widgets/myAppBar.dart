import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vouch/new_code/common_widgets/history.dart';
import 'package:vouch/new_code/common_widgets/vector.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../generated/assets.dart';
import '../home_page/settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showProfileButton;
  final String title;

  final bool showHistoryButton;
  final bool showNotificationButton;

  Function()? onSettingsButtonPressed;

  CustomAppBar({
    Key? key,
    this.showBackButton = false,
    this.title = "",
    this.showProfileButton = true,
    this.onSettingsButtonPressed,
    this.showHistoryButton = true,
    this.showNotificationButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 0,
      leading: showBackButton
          ? GestureDetector(
              onTap: (){Get.back();},
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                ),
                child: Center(
                  child: Icon(Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).alternate), // Replace with your icon
                ),
              ),
            )
          : Container(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: FlutterFlowTheme.of(context).headlineLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              showNotificationButton
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          () => SettingsScreen(),
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 500),
                          //curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(8.0.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: FlutterFlowTheme.of(context).accent4
                          ),
                          child: Icon(Icons.notifications,
                          color: FlutterFlowTheme.of(context).alternate,)),
                    )
                  : Container(
                      // width: 40.w,
                      // height: 40.h,
                      // padding: EdgeInsets.all(8.0.w),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   // color: FlutterFlowTheme.of(context).accent4
                      // ),
                    ),
              showHistoryButton
                  ? GestureDetector(
                onTap: () {
                  Get.to(
                        () => historyScreen(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    //curve: Curves.easeInOut,
                  );
                },
                child: Container(
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(8.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: FlutterFlowTheme.of(context).accent4
                    ),
                    child: Icon(Icons.history_rounded,
                      color: FlutterFlowTheme.of(context).alternate,)),
              )
                  : Container(
                // width: 40.w,
                // height: 40.h,
                // padding: EdgeInsets.all(8.0.w),
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   // color: FlutterFlowTheme.of(context).accent4
                // ),
              ),
              showProfileButton
                  ? GestureDetector(
                onTap: () {
                  Get.to(
                        () => SettingsScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500),
                    //curve: Curves.easeInOut,
                  );
                },
                child: Container(
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(8.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: FlutterFlowTheme.of(context).accent4
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsUserIcon,
                      height: 20.h,
                      width: 20.w,
                      color: FlutterFlowTheme.of(context).alternate,
                    )),
              )
                  : Container(
                // width: 40.w,
                // height: 40.h,
                // padding: EdgeInsets.all(8.0.w),
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   // color: FlutterFlowTheme.of(context).accent4
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
