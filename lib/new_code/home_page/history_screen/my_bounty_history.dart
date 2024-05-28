import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/my_bounty_widget.dart';
import 'package:vouch/new_code/home_page/history_screen/bounty_details_by_id.dart';
import 'package:vouch/new_code/home_page/history_screen/my_bounty_history_controller.dart';

class MyRaisedBountyHistory extends StatefulWidget {
  const MyRaisedBountyHistory({
    super.key,
  });

  @override
  State<MyRaisedBountyHistory> createState() => _MyRaisedBountyHistoryState();
}

class _MyRaisedBountyHistoryState extends State<MyRaisedBountyHistory> {
  final controller = Get.put(BountyHistoryController());
  var bountyHistory;

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
                  : ListView(
                  children:[ Center(
                                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 48.0.h),
                      SvgPicture.asset(Assets.assetsEmptyStateHistory,
                        height: 248.0.h,
                        width: 180.0.w,
                      ),
                      SizedBox(height: 24.0.h,),
                      AutoSizeText("You have no Bounties",
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        useGoogleFonts: false,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.7)
                      ),
                      )

                    ],
                                    ),
                                  ),]
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
