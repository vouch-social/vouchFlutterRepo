import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/new_code/common_widgets/common_button_widget.dart';
import '/new_code/common_widgets/myAppBar.dart';
import '../../backend/models/my_bounty_history_model.dart';
import '../../common_widgets/image_check.dart';


class HuntersListScreen extends StatefulWidget {
  final List<Hunter> hunters;
  const HuntersListScreen({super.key, required this.hunters});

  @override
  State<HuntersListScreen> createState() => _HuntersListScreenState();
}

class _HuntersListScreenState extends State<HuntersListScreen> {
  @override
  Widget build(BuildContext context) {
    List<Hunter> claimers = widget.hunters.where((item) => item.hunterStatus == "claimed").toList();
    List<Hunter> nonClaimers = widget.hunters.where((item) => item.hunterStatus != "claimed").toList();
    List<Hunter> newHunters = claimers;
    newHunters.addAll(nonClaimers);

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: const CustomAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Claimed Hunters",
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 24.0.h,
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: widget.hunters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.0.h),
                        child: ListTile(
                          minVerticalPadding: 4.0.h,
                          tileColor: FlutterFlowTheme.of(context).textFieldBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.w),
                          ),
                          leading: CustomCircleAvatar(
                            imageUrl: widget.hunters[index].user.photourl,
                          ),
                          title: AutoSizeText(
                            widget.hunters[index].user.name,
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          subtitle: AutoSizeText(
                            widget.hunters[index].user.localizedheadline,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                          ),
                          trailing: CustomButton(
                            onTap: () {},
                            text: 'Award',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: widget.hunters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.0.h),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0.w),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).textFieldBackground,
                              width: 1,
                            ),
                          ),
                          child: ListTile(
                            minVerticalPadding: 4.0.h,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.w),
                            ),
                            leading: CustomCircleAvatar(
                              imageUrl: widget.hunters[index].user.photourl,
                            ),
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
                                vertical: 6.0.h,
                                horizontal: 10.0.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0.w),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
                                ),
                              ),
                              child: AutoSizeText(
                                "Award",
                                minFontSize: 8,
                                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                                  color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
                                  useGoogleFonts: false,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
