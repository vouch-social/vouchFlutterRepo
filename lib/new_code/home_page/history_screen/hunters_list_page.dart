import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';

import '../../../generated/assets.dart';
import '../../backend/models/my_raised_bounty_history_model.dart';

class HuntersListScreen extends StatefulWidget {
  final List<Hunter> hunters;
  const HuntersListScreen({super.key, required this.hunters});

  @override
  State<HuntersListScreen> createState() => _HuntersListScreenState();
}

class _HuntersListScreenState extends State<HuntersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: CustomAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              AutoSizeText(
                "Claimed Hunters",
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 24.0.h,
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
              SizedBox(
                height: 24.0.h,
              ),
              AutoSizeText(
                "Unclaimed Hunters",
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              SizedBox(
                height: 24.0.h,
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
                                "Award",
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
      ),
    );
  }
}
