import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/main.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/history_screen/award_bounty_controller.dart';
import 'package:vouch/new_code/home_page/history_screen/my_bounty_history_controller.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../generated/assets.dart';
import '../../common_widgets/myAppBar.dart';

class BountyDetailsScreen extends StatefulWidget {
  final bounty;
  const BountyDetailsScreen({super.key, this.bounty});

  @override
  State<BountyDetailsScreen> createState() => _BountyDetailsScreenState();
}

class _BountyDetailsScreenState extends State<BountyDetailsScreen> {
  final controller = Get.put(BountyHistoryController());
  final awardController = Get.put(AwardBountyController());
  var bountyDetails;
  List<int> selectedHunters = [];
  bool isSelectedState= false;

  @override
  void initState() {
    super.initState();
    fetchBountyByIdHistory();
  }

  Future<void> fetchBountyByIdHistory() async {
    var fetchedBountyDetails =
        await controller.getBountyHistoryById(widget.bounty.id);
    if (!mounted) return;
    setState(() {
      bountyDetails = fetchedBountyDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Bounty Details $bountyDetails");
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 16.0.w),
        child: selectedHunters.isNotEmpty
            ? FFButtonWidget(
                text: "Award Hunters",
                onPressed: () async {
                  await awardController.awardTheHunter(
                      widget.bounty.id, selectedHunters);
                  selectedHunters = [];
                  await fetchBountyByIdHistory();
                },
                options: CTAButton(context))
            : Container(
                width: double.infinity,
                height: 20,
              ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: bountyDetails == null
              ? Center(
                  child: Container(),
                )
              : Obx(
                  () => Skeletonizer(
                    enabled: controller.isDetailsLoading.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Bounty Details",
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        SizedBox(
                          height: 16.0.h,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0.w),
                              color: FlutterFlowTheme.of(context)
                                  .primary
                                  .withOpacity(0.2),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .textFieldBackground,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16.0.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0.w),
                                  child: Row(
                                    children: [
                                      CustomCircleAvatar(
                                        imageUrl: prefs!.getString(imageUrl),
                                        radius: 18.0.w,
                                      ),
                                      SizedBox(
                                        width: 8.0.w,
                                      ),
                                      AutoSizeText(
                                        bountyDetails.user.name,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
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
                                          DateTime.fromMillisecondsSinceEpoch(
                                              bountyDetails.expiry * 1000),
                                          ifNow: "Just Now..",
                                          appendIfAfter: 'ago',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelExtraSmall
                                            .override(
                                              useGoogleFonts: false,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText
                                                      .withOpacity(0.3),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0.w),
                                  child: AutoSizeText(
                                    bountyDetails.message,
                                    style: FlutterFlowTheme.of(context)
                                        .labelExtraSmall,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(4.0.w),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .textFieldBackground,
                                    //borderRadius: BorderRadius.circular(8.0.w),
                                  ),
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
                                      AutoSizeText(
                                        bountyDetails.urgency.name == 'urgently'
                                            ? "Needs to be completed within 24 hours."
                                            : 'Needs to be completed within 36 hours.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelExtraSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0.h,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: bountyDetails.hunters.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var hunters = bountyDetails.hunters;
                                      bool isSelected = selectedHunters
                                          .contains(hunters[index].id);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w, vertical: 6.0.h),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isSelectedState && hunters[index]
                                                .hunterStatus !=
                                                "claim" ? FlutterFlowTheme.of(context).container1 : Colors.transparent,
                                            borderRadius: BorderRadius.circular(8.0.w)
                                          ),
                                          
                                          child: Opacity(
                                            opacity: 1 ,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? FlutterFlowTheme.of(context)
                                                        .primary
                                                        .withOpacity(0.2)
                                                    : FlutterFlowTheme.of(context)
                                                        .textFieldBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0.w),
                                                border: Border.all(
                                                  color:isSelected?
                                                  FlutterFlowTheme.of(context)
                                                      .primary
                                                      .withOpacity(0.2)
                                                        : FlutterFlowTheme.of(context)
                                                    .textFieldBackground,
                                                  width: 1,
                                                ),
                                              ),
                                              child: ListTile(
                                                titleAlignment:
                                                    ListTileTitleAlignment.center,
                                                minVerticalPadding: 4.0.h,
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textFieldBackground,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0.w),
                                                ),
                                                leading: CustomCircleAvatar(
                                                  imageUrl:
                                                      hunters[index].user.photourl,
                                                  radius: 18.0.w,
                                                ),
                                                title: AutoSizeText(
                                                  hunters[index].user.name,
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .titleSmall,
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      hunters[index]
                                                          .user
                                                          .localizedheadline,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .labelExtraSmall
                                                          .override(
                                                              fontSize: 10.0,
                                                              useGoogleFonts: false,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText
                                                                  .withOpacity(0.5)),
                                                    ),
                                                    SizedBox(height: 4.0.h,),
                                                    AutoSizeText(
                                                      hunters[index]
                                                          .claimMessage ?? "",
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .labelExtraSmall
                                                          .override(
                                                          fontSize: 10.0,
                                                          useGoogleFonts: false,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primaryText
                                                              .withOpacity(0.5)),
                                                    ),
                                                  ],
                                                ),
                                                trailing: hunters[index]
                                                            .hunterStatus ==
                                                        "claim"
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (isSelected) {
                                                              selectedHunters
                                                                  .remove(
                                                                      hunters[index]
                                                                          .id);
                                                              if(selectedHunters.length<=0){
                                                                isSelectedState = false;
                                                              }
                                                              print(
                                                                  "Hunter id:${hunters[index].id}");
                                                            } else {
                                                              selectedHunters.add(
                                                                  hunters[index]
                                                                      .id);
                                                              isSelectedState = true;
                                                              print(
                                                                  " Selected Hunter id:${hunters[index].id}");
                                                            }
                                                          });
                                                        },
                                                        child:
                                                        isSelected
                                                            ? Icon(Icons.radio_button_checked)
                                                            : isSelectedState ?
                                                        Icon(Icons.radio_button_off_outlined) :

                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                            vertical: 6.0.h,
                                                            horizontal: 10.0.w,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0.w),
                                                            border: Border.all(
                                                              color: isSelected
                                                                  ? FlutterFlowTheme
                                                                          .of(
                                                                              context)
                                                                      .primary
                                                                  : FlutterFlowTheme
                                                                          .of(context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                          child:


                                                          AutoSizeText(
                                                            "Award",
                                                            minFontSize: 8,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelExtraSmall
                                                                .override(
                                                                  useGoogleFonts:
                                                                      false,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 10.sp,
                                                                  color: isSelected
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                      )
                                                    : AutoSizeText(
                                                        hunters[index]
                                                                    .hunterStatus ==
                                                                "assign"
                                                            ? "Assigned"
                                                            : hunters[index]
                                                                        .hunterStatus ==
                                                                    "accept"
                                                                ? "Accepted"
                                                                : hunters[index]
                                                                            .hunterStatus ==
                                                                        "ignore"
                                                                    ? "Ignored"
                                                                    : hunters[index]
                                                                                .hunterStatus ==
                                                                            "award"
                                                                        ? "Awarded"
                                                                        : "",
                                                        minFontSize: 8,
                                                        style: FlutterFlowTheme.of(
                                                                context)
                                                            .labelExtraSmall
                                                            .override(
                                                              useGoogleFonts: false,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 10.sp,
                                                            ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
