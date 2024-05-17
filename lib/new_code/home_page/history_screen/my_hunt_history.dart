import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/home_page/history_screen/my_hunts_controller.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../common_widgets/my_hunts_card.dart';

class MyHuntsScreen extends StatefulWidget {
  const MyHuntsScreen({super.key});

  @override
  State<MyHuntsScreen> createState() => _MyHuntsScreenState();
}

class _MyHuntsScreenState extends State<MyHuntsScreen> {
  final controller = Get.put(HuntsController());
  var huntsHistory;

  @override
  void initState() {
    super.initState();
    fetchHuntsHistory();
  }

  Future<void> fetchHuntsHistory() async {
    var fetchedBountyHistory = await controller.getHuntsHistory();
    if (!mounted) return;
    setState(() {
      huntsHistory = fetchedBountyHistory.myHunts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: RefreshIndicator(
        color: FlutterFlowTheme.of(context).primary,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        onRefresh: () async {
          await fetchHuntsHistory();
        },
        child: Obx(
          () => Skeletonizer(
            enabled: controller.isLoading.value,
            child:
            huntsHistory != null ?
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              itemCount: huntsHistory?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var hunts = huntsHistory[index];
                return myHuntsWidget(context, hunts);
              },
            ) : Center(
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            )
          ),
        ),
      ),
    );
  }
}
