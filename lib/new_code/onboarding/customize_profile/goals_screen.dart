import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/home_page/new_home_page.dart';

import '../../../backend/firebase_analytics/analytics.dart';
import '../../../final_design/onboarding/linkedin/linkedin_widget.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.0.h,
              ),
              AutoSizeText(
                'Hey Nirant',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              AutoSizeText(
                'good morning,',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 24.0.h,
              ),
              AutoSizeText(
                'Set your goal',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              AutoSizeText(
                'Please set at least 3 goals. You will have the\nability to edit your choices at any point.',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0.w),
          //     border: Border.all(),// Border radius
          //   ),
          //   child: TextField(
          //     minLines: 3,
          //     maxLines: 5,
          //     decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Color(0xFFEBF2F4),
          //       contentPadding: EdgeInsets.all(12.0.w),
          //       hintText: 'Type here...',
          //       hintStyle: TextStyle(
          //         fontFamily: 'Bricolage Grotesque',
          //         color: FlutterFlowTheme.of(context).primaryText,
          //         fontWeight: FontWeight.w300,
          //         fontSize: 14.0,
          //       ),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8.0.w),
          //         borderSide: BorderSide.none
          //       )
          //     ),
          //   ),
          // ),
              TabBar(
                controller: _tabController,
                //indicatorColor: Colors.yellow,
                unselectedLabelColor: Colors.blue,
                tabs: [
                  Container(
                   decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                     color: Colors.red
                    ),
                  ),
                  Container(height: 4,
                    width: 140,decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0)
                    ),),
                  Container(height: 4,
                    width: 140,decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0)
                    ),),
                ],
                indicatorWeight: .50,
                // indicator: BoxDecoration(
                //   //color: Colors.yellow,
                //     borderRadius: BorderRadius.circular(8.0)
                // ),
                labelColor: Colors.red,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.w),
                          border: Border.all(),// Border radius
                        ),
                        child: TextField(
                          minLines: 3,
                          maxLines: 5,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFEBF2F4),
                            contentPadding: EdgeInsets.all(12.0.w),
                            hintText: 'Type here...',
                            hintStyle: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.w),
                              borderSide: BorderSide.none
                            )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Replace this with content for Tab 2
                        child: Text('Tab 2 Content'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Replace this with content for Tab 3
                        child: Text('Tab 3 Content'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              AutoSizeText(
                'Example:',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  useGoogleFonts: false,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Row(
                children: [
                  Chip(
                    label: AutoSizeText('I want to buy a 2nd car',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide.none,
                    ),
                  ),
                  SizedBox(
                    width: 8.0.h,
                  ),
                    Chip(
                      label: AutoSizeText('Find Math tutor',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          useGoogleFonts: false,
                        ),
                      ),
                      backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide.none,
                      ),
                    ),
                  ],
                  ),

              Row(
                children: [
                  Chip(
                    label: AutoSizeText('Pet boarding services',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide.none,
                    ),
                  ),
                  SizedBox(
                    width: 8.0.h,
                  ),
                  Chip(
                    label: AutoSizeText('Macbook reseller',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide.none,
                    ),
                  ),
                  SizedBox(
                    width: 8.0.h,
                  ),
                  Chip(
                    label: AutoSizeText('Home',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide.none,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Chip(
                    label: AutoSizeText('Ux designer jobs in bangalore',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide.none,
                    ),
                  ),
                  SizedBox(
                    width: 8.0.h,
                  ),
                  Chip(
                    label: AutoSizeText('Mobile repair services',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                    ),
                    backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      side: BorderSide.none,
                    ),
                  ),
                ],
              ),

              const Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  // logFirebaseEvent(
                  //     'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                  // logFirebaseEvent('Button_request_permissions');
                  // logFirebaseEvent('Button_navigate_to');
                  if (_tabController.index < 2) {
                    _tabController.animateTo(_tabController.index + 1);
                  }
                  
                },
                text: 'Next',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 64.0.h,
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle:
                  FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Bricolage Grotesque',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 28.0.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
