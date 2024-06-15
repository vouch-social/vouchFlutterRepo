import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/generated/assets.dart';
import '/new_code/common_widgets/my_bounty_widget.dart';
import '/new_code/home_page/history_screen/bounty_details_by_id.dart';
import '/new_code/home_page/history_screen/my_bounty_history_controller.dart';

class MyRaisedBountyHistory extends StatefulWidget {
  const MyRaisedBountyHistory({
    super.key,
  });

  @override
  State<MyRaisedBountyHistory> createState() => _MyRaisedBountyHistoryState();
}

class _MyRaisedBountyHistoryState extends State<MyRaisedBountyHistory> {
  final controller = Get.put(BountyHistoryController());
  var bountyHistory = [];

  @override
  void initState() {
    super.initState();
    fetchBountyHistory();
  }

  Future<void> fetchBountyHistory() async {
    var fetchedBountyHistory = await controller.getBountyHistory();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          bountyHistory = fetchedBountyHistory.myBountyListData;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("BountyHistory : $bountyHistory");
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: RefreshIndicator(
        onRefresh: () async {
          await fetchBountyHistory();
        },
        child: Obx(
          () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: controller.isLoading.value == false
                  ? (bountyHistory.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          itemCount: bountyHistory.length,
                          itemBuilder: (BuildContext context, int index) {
                            var bounty = bountyHistory[index];
                            return MyBountyWidget(
                              bounty: bounty,
                              refreshCallback: fetchBountyHistory,
                            );
                          },
                        )
                      : Center(
                          child: ListView(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 80.0.h),
                                Image.asset(
                                  Assets.assetsBounty,
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.0.w),
                                  child: AutoSizeText(
                                    "Start your first bounty to see them here!",
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                            fontSize: 18,
                                            useGoogleFonts: false,
                                            fontWeight: FontWeight.w400,
                                            color: FlutterFlowTheme.of(context)
                                                .ffButton
                                                .withOpacity(0.7)),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ))
                  : Center(
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    )),
        ),
      ),
    );
  }
}
