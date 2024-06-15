import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '/new_code/common_widgets/myAppBar.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';
import '/new_code/home_page/scanner_screen/my_code_screen.dart';
import '/new_code/home_page/scanner_screen/scan_code_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        showBackButton: true,
        onBackButtonPressed: () {
          Get.off(() => const NewHomePage());
        },
        showNotificationButton: false,
        showProfileButton: false,
        showHistoryButton: false,
        title: "Vouch QR",
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
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
                    "Scan Code",
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Code",
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
                  BarCodeScanner(),
                  MyCodeScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
