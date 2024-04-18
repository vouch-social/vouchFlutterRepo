

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import 'goals_controller.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen>
    with TickerProviderStateMixin {
   final controller = Get.put(GoalsController());
  late List<TextEditingController> controllers;
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(3, (index) => TextEditingController());

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

  void _handleChipSelection(String text) {
    setState(() {
      controllers[_currentIndex].text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.0.h,
                  ),
                  AutoSizeText('Set your goal',
                      style: FlutterFlowTheme.of(context).displayMedium),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  AutoSizeText(
                      'Please set at least 3 goals. You will have the\nability to edit your choices at any point.',
                      style: FlutterFlowTheme.of(context).titleSmall),
                  SizedBox(
                    height: 16.0.h,
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              automaticIndicatorColorAdjustment: false,
              padding: EdgeInsets.all(16.0.w),
              labelPadding: EdgeInsets.zero,
              tabs: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.w),
                    color: _currentIndex >= 0
                        ? FlutterFlowTheme.of(context).ffButton
                        : FlutterFlowTheme.of(context).ffButton.withAlpha(51),
                  ),
                  margin: EdgeInsets.only(right: 6.0.w),
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.only(right: 2.0.w, left: 2.0.w),
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.w),
                      color: _currentIndex >= 1
                          ? FlutterFlowTheme.of(context).ffButton
                          : FlutterFlowTheme.of(context)
                          .ffButton
                          .withAlpha(51)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.0.w),
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.w),
                    color: _currentIndex >= 2
                        ? FlutterFlowTheme.of(context).ffButton
                        : FlutterFlowTheme.of(context).ffButton.withAlpha(51),
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
                  _tab(_currentIndex, context),
                  _tab(_currentIndex, context),
                  _tab(_currentIndex, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab(_currentIndex, context) {
    return Container(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.0.h,
          ),
          AutoSizeText("Type your Goal 0${_currentIndex + 1}",
              style: FlutterFlowTheme.of(context).titleLarge),
          SizedBox(height: 12.0.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0.w),
              // Border radius
            ),
            child: TextFormField(
              controller: controllers[_currentIndex],
              minLines: 3,
              maxLines: 5,
              style: FlutterFlowTheme.of(context).labelSmall,
              decoration: InputDecoration(
                filled: true,
                fillColor: FlutterFlowTheme.of(context).textFieldBackground,
                contentPadding: EdgeInsets.all(12.0.w),
                hintText: "Type here...",
                hintStyle: FlutterFlowTheme.of(context).labelSmall,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.w),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(
            height: 16.0.h,
          ),
          AutoSizeText('Example:',
              style: FlutterFlowTheme.of(context).titleSmall),
          SizedBox(
            height: 8.0.h,
          ),
          Wrap(
            spacing: 8.0,
            children: [
              _buildChip('I want to buy a 2nd car'),
              _buildChip('I want to sdfgfd buy a 2nd car'),
              _buildChip('I buy a 2nd car'),
              _buildChip('I want to buy car'),
              _buildChip('Find Math tutor'),
            ],
          ),
          const Spacer(),
          FFButtonWidget(
              onPressed: () async {







                if(controllers[0].text.isEmpty && _tabController.index == 1){
                  //_tabController.animateTo(_tabController.index = 0);
                  Get.snackbar("Alert", "Please Type your goal 01");
                }else{
                  _tabController.animateTo(_tabController.index +1  );
                }
                if(controllers[1].text.isEmpty && _tabController.index == 2){
                  //_tabController.animateTo(_tabController.index = 1);
                  Get.snackbar("Alert", "Please Type your goal 02");
                }else{
                  _tabController.animateTo(_tabController.index + 1);
                }
                if(controllers[3].text.isEmpty && _tabController.index == 2){
                  Get.snackbar("Alert", "Please Type your goal 03");
                }
                if (_tabController.index < 2 && controllers[0].text.isNotEmpty || controllers[1].text.isNotEmpty) {
                  _tabController.animateTo(_tabController.index + 1);
                }
                if(controllers[3].text.isNotEmpty && controllers[2].text.isNotEmpty && controllers[3].text.isNotEmpty){
                  controller.sendUserGoalsController();
                }

              },
              text: _currentIndex == 2 ? 'Finish' : 'Next',
              options: CTAButton(context)),
          SizedBox(
            height: 16.0.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: AutoSizeText(
                "Skip for now",
                style: FlutterFlowTheme.of(context).labelExtraSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return GestureDetector(
      onTap: () {
        _handleChipSelection(label);
      },
      child: Chip(
        // color: MaterialStateProperty.all(FlutterFlowTheme.of(context).textFieldBackground),
        backgroundColor:
        MediaQuery.of(context).platformBrightness == Brightness.dark ?

        FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9):
        FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
        label: AutoSizeText(label,

          style: FlutterFlowTheme.of(context).labelExtraSmall,
        ),
      ),);
  }
}

