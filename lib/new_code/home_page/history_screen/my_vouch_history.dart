import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/new_code/common_widgets/vouchCard.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../generated/assets.dart';
import '../../common_widgets/myVouchCard.dart';
import 'my_vouch_history_controller.dart';

class MyVouchHistory extends StatefulWidget {
  const MyVouchHistory({super.key});

  @override
  State<MyVouchHistory> createState() => _MyVouchHistoryState();
}

class _MyVouchHistoryState extends State<MyVouchHistory> {
  final controller = Get.put(VouchController());
  var vouchHistory = [];

  @override
  void initState() {
    super.initState();
    fetchVouchHistory();
  }

  Future<void> fetchVouchHistory() async {
    var fetchedVouchHistory = await controller.getVouchHistory();
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        vouchHistory = fetchedVouchHistory.mySelectedPathListData;
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
          await fetchVouchHistory();
        },
        child: Obx(
          () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: controller.isLoading.value == false && vouchHistory != null
                  ?(
                  vouchHistory.isNotEmpty )?
                  ListView.builder(
                      itemCount: vouchHistory?.length ?? 0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      itemBuilder: (BuildContext context, int index) {
                        var vouch = vouchHistory[index];
                        if (vouch.status == "cancel") {
                          return Container();
                        } else {
                          return MyVouchCard(vouch:  vouch,refreshCallBack: fetchVouchHistory);
                        }
                      },
                    ) :
                  Center(
                    child: ListView(
                        children:[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 80.0.h),
                              Image.asset(Assets.assetsOutreach,
                              height: 300.0.h,
                                width: 300.0.w,
                              ),
                              AutoSizeText("Search and explore paths to see them here!",
                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontSize: 18,
                                    useGoogleFonts: false,
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
                    )),
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
