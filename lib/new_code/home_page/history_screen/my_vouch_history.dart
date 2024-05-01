import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/common_widgets/vouchCard.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../common_widgets/myVouchCard.dart';
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
    fetchVouchHistory();
  }

  void fetchVouchHistory() async {
    var fetchedVouchHistory = await controller.getVouchHistory();
    setState(() {
      vouchHistory = fetchedVouchHistory.mySelectedPathListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body:  Obx(
        () =>  Skeletonizer(
          enabled: controller.isLoading.value,
          child: ListView.builder(
                  itemCount: vouchHistory?.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  itemBuilder: (BuildContext context, int index) {
                    var vouch = vouchHistory[index];
                    return myVouchWidget(context,vouch);
                  },
                ),
        ),
      ),
    );
  }
}
//
// Container(
// color: FlutterFlowTheme.of(context).container3,
// width: double.infinity,
// padding: EdgeInsets.all(16.0.w),
// child: Column(
// children: [
// Text('ID: ${vouch.id ?? "blank"}'),
// Text('User ID: ${vouch.userId ?? "blank"}'),
// Text('Message: ${vouch.message ?? "blank"}'),
// Text('Tags: ${vouch.status ?? "blank"}'),
// Text('Urgency ID: ${vouch.pathlength ?? "blank"}'),
// Text('StartNode: ${vouch.startnode ?? "blank"}'),
// Text('EndNode: ${vouch.endnode ?? "blank"}'),
// Text('Created At: ${vouch.createdAt ?? "blank"}'),
// Text('Updated At: ${vouch.updatedAt ?? "blank"}'),
// ],
// ),
// );