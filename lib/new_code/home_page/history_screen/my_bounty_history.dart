import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/home_page/history_screen/my_bounty_history_controller.dart';

import '../../backend/models/my_raised_bounty_history_model.dart';

class MyRaisedBountyHistory extends StatefulWidget {

  const MyRaisedBountyHistory({super.key, });

  @override
  State<MyRaisedBountyHistory> createState() => _MyRaisedBountyHistoryState();
}

class _MyRaisedBountyHistoryState extends State<MyRaisedBountyHistory> {
  final controller = Get.put(BountyController());
  var bountyHistory;

  @override
  void initState() {
    super.initState();
    fetchBountyHistory();
  }

  void fetchBountyHistory() async {
    var fetchedBountyHistory = await controller.getBountyHistory();
    setState(() {
      bountyHistory = fetchedBountyHistory.data.myBountyListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("BountyHistory : $bountyHistory");
    return Scaffold(
      body: bountyHistory == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: bountyHistory?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var bounty = bountyHistory[index];
          return Container(
            color: FlutterFlowTheme.of(context).container3,
            width: double.infinity,
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                Text('ID: ${bounty.id}'),
                Text('User ID: ${bounty.userId}'),
                Text('Message: ${bounty.message}'),
                Text('Tags: ${bounty.tags.join(', ')}'),
                Text('Urgency ID: ${bounty.urgencyId}'),
                Text('Expiry: ${bounty.expiry}'),
                Text('Created At: ${bounty.createdAt}'),
                Text('Updated At: ${bounty.updatedAt}'),
              ],
            ),
          );
        },
      ),
    );
  }
}