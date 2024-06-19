import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import '../../backend/models/feeds_model.dart';


class OtherHuntersList extends StatefulWidget {
  final List<Hunter> hunters;
  const OtherHuntersList({super.key, required this.hunters});

  @override
  State<OtherHuntersList> createState() => _OtherHuntersListState();
}

class _OtherHuntersListState extends State<OtherHuntersList> {
  @override
  Widget build(BuildContext context) {
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
                "Hunters",
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
                            tileColor: widget.hunters[index].hunterStatus == 'assign' ? FlutterFlowTheme.of(context).primaryBackground:
                            FlutterFlowTheme.of(context).textFieldBackground,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0.w)),
                            leading:
                            CustomCircleAvatar(
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
                            trailing: AutoSizeText(
                              widget.hunters[index].hunterStatus == 'assign' ?
                              'Assigned': widget.hunters[index].hunterStatus == 'accept' ? 'Hunting' : widget.hunters[index].hunterStatus == 'awarded' ? "Awarded" : "Claimed",
                              minFontSize: 8,
                              style: FlutterFlowTheme.of(context)
                                  .labelExtraSmall
                                  .override(
                                  color : widget.hunters[index].hunterStatus == 'assign' ? FlutterFlowTheme.of(context)
                                      .primaryText
                                      .withOpacity(0.2) : FlutterFlowTheme.of(context)
                                      .primaryText,
                                  useGoogleFonts: false,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
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
