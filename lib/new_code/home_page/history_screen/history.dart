import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../backend/models/my_raised_bounty_history_model.dart';
import '../../common_widgets/myAppBar.dart';
import 'my_bounty_history_controller.dart';
import 'my_bounty_history.dart';
import 'my_vouch_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}


class _HistoryScreenState extends State<HistoryScreen> with TickerProviderStateMixin {
  late final MyBountyHistoryModel myBountyHistoryModel;

  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showHistoryButton: false,
        showBackButton: true,
        title: "History",
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: FlutterFlowTheme.of(context).primary,
            automaticIndicatorColorAdjustment: true,
            // indicator: BoxDecoration(
            //   color: FlutterFlowTheme.of(context).primaryBackground,
            //
            // ),
            // labelStyle: FlutterFlowTheme.of(context).titleSmall,
            // padding: EdgeInsets.fromLTRB(16.0.w,0.0.w,16.0.w,0),
            // labelPadding: EdgeInsets.zero,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "My Bounties",
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "My Vouch",
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: [
                MyRaisedBountyHistory(),
                MyVouchHistory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
