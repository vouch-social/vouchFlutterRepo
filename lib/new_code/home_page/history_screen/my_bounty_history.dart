import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/home_page/history_screen/history_controller.dart';

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

    // TODO: implement initState
  print("Controller: $controller");
    super.initState();
  }
  @override
  void setState(VoidCallback fn) async{
    bountyHistory = await controller.getBountyHistory();
    // TODO: implement setState
    super.setState(fn);
  }
  late final MyBountyHistoryModel myBountyHistoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: FlutterFlowTheme.of(context).container3,
            width: double.infinity,
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                Text('ID: ${bountyHistory.data}'),
                Text('User ID: '),
                Text('Message: '),
                Text('Tags: '),
                Text('Urgency ID: '),
                Text('Expiry:'),
                Text('Created At: '),
                Text('Updated At: '),
              ],
            )
          );
        },
      ),
    );
  }
}
