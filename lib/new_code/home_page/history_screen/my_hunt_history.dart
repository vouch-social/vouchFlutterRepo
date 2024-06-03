import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/home_page/history_screen/my_hunts_controller.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../generated/assets.dart';
import '../../common_widgets/my_hunts_card.dart';

class MyHuntsScreen extends StatefulWidget {
  const MyHuntsScreen({super.key});

  @override
  State<MyHuntsScreen> createState() => _MyHuntsScreenState();
}

class _MyHuntsScreenState extends State<MyHuntsScreen> {
  final controller = Get.put(HuntsController());
  var huntsHistory = [];

  @override
  void initState() {
    super.initState();
    fetchHuntsHistory();
  }

  Future<void> fetchHuntsHistory() async {
    var fetchedBountyHistory = await controller.getHuntsHistory();
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
      huntsHistory = fetchedBountyHistory.myHunts;
    });
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
            controller.isLoading.value == false ?
            (huntsHistory.isNotEmpty)?
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              itemCount: huntsHistory.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var hunts = huntsHistory[index];
                return MyHuntsCard(hunts:  hunts,refreshCallBack: fetchHuntsHistory);
              },
            ) :Center(
              child: ListView(
                  children:[ Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.0.h),
                      Image.asset(Assets.assetsHunt,
                        height: 300.0.h,
                        width: 300.0.w,
                      ),
                      AutoSizeText("Start hunting for bounties to see them here!",
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                            useGoogleFonts: false,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.7)
                        ),
                      )

                    ],
                  ),]
              ),
            )
                : Center(
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
