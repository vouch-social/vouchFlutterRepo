import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/main.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
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
  @override
  void initState() {
    super.initState();
    fetchBountyByIdHistory();
  }

  void fetchBountyByIdHistory() async {
    var fetchedBountyDetails = await controller.getBountyHistoryById(widget.bounty.id);
    if (!mounted) return;
    setState(() {
      bountyDetails = fetchedBountyDetails;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("Bounty Details $bountyDetails");
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child:
            bountyDetails == null ? Container() :
            Obx(
              () =>  Skeletonizer(
                enabled: controller.isDetailsLoading.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Your Bounty",
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.0.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0.w),
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .textFieldBackground)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18.0.w,
                                  child: prefs?.getString(imageUrl) != null &&
                                      prefs!.getString(imageUrl)
                                          !.startsWith('http')
                                      ? Image.network(
                                      prefs!.getString(imageUrl).toString()
                                  ) : Image.asset(Assets.assetsImage951),
                                ),
                                SizedBox(
                                  width: 8.0.w,
                                ),
                                AutoSizeText(
                                  bountyDetails.user.name,
                                  style: FlutterFlowTheme.of(context).labelSmall,
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
                                      DateTime.fromMillisecondsSinceEpoch(bountyDetails.expiry*1000),
                                      ifNow: "Just Now..",
                                      appendIfAfter: 'ago'),
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                          useGoogleFonts: false,
                                          fontWeight: FontWeight.w400,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText
                                              .withOpacity(0.3)),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0.h,),
                            AutoSizeText(bountyDetails.message,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Container(
                              color: FlutterFlowTheme.of(context).textFieldBackground,
                              width: double.infinity,
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
                                  AutoSizeText(bountyDetails.urgency.name == 'urgently' ? "Needs to be completed with in 24hours." : '' ,
                                  style: FlutterFlowTheme.of(context).labelExtraSmall,
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
                                  itemBuilder: (BuildContext context, int index) {
                                    var hunters = bountyDetails.hunters;
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 12.0.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).textFieldBackground,
                                            borderRadius: BorderRadius.circular(8.0.w),
                                            border: Border.all(
                                                color: FlutterFlowTheme.of(context)
                                                    .textFieldBackground,
                                                width: 1)),
                                        child: ListTile(
                                          minVerticalPadding: 4.0.h,
                                          tileColor:
                                          FlutterFlowTheme.of(context).textFieldBackground,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0.w)),
                                          leading:
                                          CircleAvatar(
                                            radius: 18.0.w,
                                            backgroundColor: Colors.transparent,
                                            child: hunters[index].user.photourl
                                                    .contains('http')
                                                ? Image.network(
                                                hunters[index].user.photourl)
                                                : Image.asset(Assets.assetsImage951),
                                          ),
                                          title: AutoSizeText(
                                            hunters[index].user.name,
                                            style: FlutterFlowTheme.of(context).titleSmall,
                                          ),
                                          subtitle: AutoSizeText(
                                            hunters[index].user.localizedheadline,
                                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                                          ),
                                          trailing:

                                          hunters[index].hunterStatus == "claim"?
                                          GestureDetector(
                                            onTap: () async{
                                              await awardController.awardTheHunter(widget.bounty.id, hunters[index].id);
                                            },
                                            child: Container(
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
                                          ) :  AutoSizeText(
                                            hunters[index].hunterStatus,
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
                            SizedBox(height: 16.0.h,),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
