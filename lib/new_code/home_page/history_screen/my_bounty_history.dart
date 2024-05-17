import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
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
    if (!mounted) {
      return;
    }
    setState(() {
      bountyHistory = fetchedBountyHistory.myBountyListData;
    });
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
              child: bountyHistory != null
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      itemCount: bountyHistory?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var bounty = bountyHistory[index];

                        return myBountyWidget(context, bounty);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    )),
        ),
      ),
    );
  }
}
