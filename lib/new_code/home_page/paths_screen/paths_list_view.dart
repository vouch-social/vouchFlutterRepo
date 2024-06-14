import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/paths_screen/final_path_message_screen.dart';
import 'package:vouch/new_code/home_page/paths_screen/path_success_screen.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_controller.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../main.dart';
import '../../backend/backend_constants.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/models/paths_model.dart';

class PathListView extends StatefulWidget {
  final dynamic goal;
  final AllPaths allPaths;
  const PathListView({super.key, required this.allPaths, required this.goal});

  @override
  State<PathListView> createState() => _PathListViewState();
}

class _PathListViewState extends State<PathListView>
    with TickerProviderStateMixin {
  late TabController? _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.allPaths.finalPaths,
      vsync: this,
    );

    _tabController?.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  final pathController = Get.put(PathsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0.h)),
        color: FlutterFlowTheme.of(context).fixedBlack,
      ),
      child: widget.allPaths.finalPaths != 0
          ? Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      widget.allPaths.finalPaths,
                      (index) => MyListView(
                        paths: widget.allPaths.singlePathList[index],
                        totalCount: widget.allPaths.finalPaths,
                        index: index,
                        onPressed: (data) {
                          print(
                              'Button pressed in tab $index with data: $data');
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80.0.w,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    automaticIndicatorColorAdjustment: false,
                    padding: EdgeInsets.all(16.0.w),
                    labelPadding: EdgeInsets.zero,
                    tabs: List.generate(
                      widget.allPaths.finalPaths,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 4.0.w),
                        height: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0.w),
                            color: _currentIndex == index
                                ? FlutterFlowTheme.of(context).fixedWhite
                                : FlutterFlowTheme.of(context)
                                    .fixedWhite
                                    .withAlpha(51)),
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0.h, 0, 16.0.h, 16.0.h),
                  child: FFButtonWidget(
                          text: "Select Path",
                          onPressed: () async {
                            if (_tabController != null) {
                              final int currentIndex = _tabController!.index;
                              print(
                                  "currentIndex: $currentIndex,singlePath:  ${widget.allPaths.singlePathList[currentIndex]}");

                              Get.to(() => FinalPathMessageScreen(
                                  goal: widget.goal,
                                  currentIndex: currentIndex,
                                  singlePath: widget
                                      .allPaths.singlePathList[currentIndex]));
                            }
                          },
                          options: CTAButton(context))

                )
              ],
            )
          : Padding(
            padding:  EdgeInsets.fromLTRB(16.0.h, 0, 16.0.h, 16.0.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32.0.h,
                  ),
                  AutoSizeText(
                    "No Paths Found!",
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedWhite),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  prefs!.getBool(isContactSync)! == true
                      ? AutoSizeText(
                          "Explore new connections to bridge the gap.",
                          style: FlutterFlowTheme.of(context).titleLarge.override(
                              useGoogleFonts: false,
                              color: FlutterFlowTheme.of(context).fixedWhite),
                        )
                      : AutoSizeText(
                          "Unable to get paths.. your contacts aren't synced.",
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedWhite),
                                      ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Image.asset(
                    Assets.assetsPaths,
                    height: 240.0.h,
                  ),
                  prefs!.getBool(isContactSync)! == false ?
               FFButtonWidget(
                text: "Sync Contacts",
                onPressed: () async {
                  Get.to(() => const PermissionsScreen());
                },
                options: CTAButton(context)) : Container(),

                ],
              ),
          ),
    );
  }
}

class MyListView extends StatelessWidget {
  final SinglePath paths;
  final int totalCount;
  final int index;
  final Function(PathNode) onPressed;
  const MyListView({
    super.key,
    required this.paths,
    required this.totalCount,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    print("Json Encode: ${jsonEncode(paths)}");
    return Column(
      children: [
        SizedBox(
          height: 16.0.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0.w, right: 16.0.w),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
                width: 36.0.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0.w),
                  color:
                      FlutterFlowTheme.of(context).fixedWhite.withOpacity(0.1),
                ),
                padding: EdgeInsets.all(4.0.h),
                child: Text(
                  "${index + 1}/$totalCount",
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).fixedWhite),
                )),
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: paths.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///Column
                      ///Icon
                      ///dottedline
                      Column(
                        children: [
                          index != 0
                              ? DottedLine(
                                  dashLength: 2,
                                  dashGapLength: 4,
                                  lineThickness: 1,
                                  dashRadius: 1,
                                  dashColor: FlutterFlowTheme.of(context)
                                      .fixedWhite
                                      .withOpacity(0.6),
                                  direction: Axis.vertical,
                                  lineLength: 30.h,
                                )
                              : Container(
                                  height: 30.0.h,
                                ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).fixedBlack,
                                    borderRadius: BorderRadius.circular(10.0.w),
                                    border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .fixedWhite
                                            .withOpacity(0.6),
                                        width: 1.0.w)),
                                height: 20.0.h,
                                width: 20.0.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).fixedWhite,
                                    borderRadius: BorderRadius.circular(4.0.w)),
                                height: 8.0.h,
                                width: 8.0.w,
                              ),
                            ],
                          ),
                          index >= paths.length - 1
                              ? Container(
                                  height: 30.0.h,
                                )
                              : DottedLine(
                                  dashLength: 2,
                                  dashGapLength: 4,
                                  lineThickness: 1,
                                  dashRadius: 1,
                                  dashColor: FlutterFlowTheme.of(context)
                                      .fixedWhite
                                      .withOpacity(0.6),
                                  // dashGapColor: Colors.red,
                                  direction: Axis.vertical,
                                  lineLength: 30.0.h,
                                ),
                        ],
                      ),

                      ///dottedline
                      DottedLine(
                        dashLength: 2,
                        dashGapLength: 4,
                        lineThickness: 1,
                        dashRadius: 1,
                        dashColor: FlutterFlowTheme.of(context)
                            .fixedWhite
                            .withOpacity(0.6),
                        // dashGapColor: Colors.red,
                        direction: Axis.horizontal,
                        lineLength: 28,
                      ),

                      ///Stack
                      ///Image
                      ///logo
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                              radius: 25.0.w,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).fixedWhite,
                              child: CustomCircleAvatar(
                                imageUrl: paths.pathNode[index].image,
                                radius: 24.0.w,
                              )),
                          paths.pathNode[index].isRegistered
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 20.0.h,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0.w),
                                      color:
                                          FlutterFlowTheme.of(context).primary),
                                  child: SvgPicture.asset(
                                    'assets/welcomeLogo.svg',
                                    width: 16.0.w,
                                    color:
                                        FlutterFlowTheme.of(context).fixedWhite,
                                  ))
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        width: 16.0.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${paths.pathNode[index].name}",
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                    color:
                                        FlutterFlowTheme.of(context).fixedWhite,
                                    useGoogleFonts: false),
                          ),
                          SizedBox(
                            height: 4.0.h,
                          ),
                          SizedBox(
                            width: 240.w,
                            child: Padding(
                              padding: EdgeInsets.only(right: 48.0.w),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                "${paths.pathNode[index].heading}",
                                style: FlutterFlowTheme.of(context)
                                    .labelExtraSmall
                                    .override(
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                      color: FlutterFlowTheme.of(context)
                                          .fixedWhite,
                                    ),
                              ),
                            ),
                          )
                        ],
                      )

                      ///coloumn
                      ///Name
                      ///headline
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }
}
