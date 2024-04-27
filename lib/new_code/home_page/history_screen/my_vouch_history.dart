import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../bounty_screen/bounty_controller.dart';
import 'my_vouch_history_controller.dart';

class MyVouchHistory extends StatefulWidget {
  const MyVouchHistory({super.key});

  @override
  State<MyVouchHistory> createState() => _MyVouchHistoryState();
}

class _MyVouchHistoryState extends State<MyVouchHistory> {
  final controller = Get.put(VouchController());
  var vouchHistory;

  @override
  void initState() {
    super.initState();
    fetchBountyHistory();
  }

  void fetchBountyHistory() async {
    var fetchedBountyHistory = await controller.getVouchHistory();
    setState(() {
      vouchHistory = fetchedBountyHistory.data.mySelectedPathListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Vouch: $vouchHistory");
    return Scaffold(
      body: vouchHistory == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: vouchHistory?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var vouch = vouchHistory[index];
                return Container(
                  color: FlutterFlowTheme.of(context).container3,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    children: [
                      Text('ID: ${vouch[index].id}'),
                      Text('User ID: ${vouch.userId}'),
                      Text('Message: ${vouch.message}'),
                      Text('Tags: ${vouch.status}'),
                      Text('Urgency ID: ${vouch.pathlength}'),
                      Text('StartNode: ${vouch.startnode}'),
                      Text('EndNode: ${vouch.endnode}'),
                      Text('Created At: ${vouch.createdAt}'),
                      Text('Updated At: ${vouch.updatedAt}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
