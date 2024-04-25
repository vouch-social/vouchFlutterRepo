import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'myAppBar.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({super.key});

  @override
  State<historyScreen> createState() => _historyScreenState();
}


class _historyScreenState extends State<historyScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

                Container(
                  color: Colors.yellow,
                )     ,
            Container(
            color: Colors.black,
          )
              ],
            ),
          ),
        ],
      ),
    )
      ;
  }
}
