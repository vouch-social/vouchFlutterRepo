import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/backend/models/paths_model.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_list_view.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

import '../../../generated/assets.dart';
import '../../common_widgets/myAppBar.dart';
import '../../common_widgets/vector.dart';
import '../HomePage/paths_list_controller.dart';

class PathsScreen extends StatefulWidget {
  final dynamic name;
  final dynamic image;
  final dynamic headline;
  final dynamic goals;
  final dynamic index;
  final dynamic hashedPhone;
  final dynamic reason;
  const PathsScreen({
    super.key,
    this.name,
    this.image,
    this.headline,
    this.goals,
    this.index,
    this.hashedPhone,
    this.reason,
  });

  @override
  State<PathsScreen> createState() => _PathsScreenState();
}

class _PathsScreenState extends State<PathsScreen> {
  final controller = Get.put(HomeController());
  var allPaths;

  void fetchPaths() async {
    var fetchedPaths = await controller.getPathsList(widget.hashedPhone);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      setState(() {
        allPaths = fetchedPaths;
      });
    });
  }

  void _initializeData(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchPaths();
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    print("Path Path : ${widget.image}");
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: FlutterFlowTheme.of(context).fixedWhite,
        showBackButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).fixedWhite,
      body: SafeArea(
          child: Obx(
            () => Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Hero(
                      tag: "image:${widget.index}",
                      child: Material(
                          color: Colors.transparent,
                          child: CustomCircleAvatar(
                            imageUrl: widget.image,
                            radius: 64.0.w,
                          )),
                    ),
                    SizedBox(
                      height: 16.0.h,
                    ),
                    Hero(
                      tag: "name:${widget.index}",
                      child: Material(
                        color: Colors.transparent,
                        child: AutoSizeText(
                          widget.name,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                  useGoogleFonts: false,
                                  color: FlutterFlowTheme.of(context).fixedBlack),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.0.w),
                      child: Hero(
                        tag: "headline:${widget.index}",
                        child: Material(
                          color: Colors.transparent,
                          child: AutoSizeText(
                            widget.headline,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    useGoogleFonts: false,
                                    color:
                                        FlutterFlowTheme.of(context).fixedBlack),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).container1,
                          borderRadius: BorderRadius.circular(0.0.w)),
                      padding: EdgeInsets.all(0.0.w),
                      child: Hero(
                        tag: "goal:${widget.index}",
                        child: Material(
                          child: AutoSizeText(
                            widget.goals,
                            style: FlutterFlowTheme.of(context)
                                .labelExtraSmall
                                .override(
                                    useGoogleFonts: false,
                                    fontWeight: FontWeight.w400,
                                    color: FlutterFlowTheme.of(context)
                                        .fixedBlack
                                        .withOpacity(.50)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).container1,
                          borderRadius: BorderRadius.circular(0.0.w)),
                      padding: EdgeInsets.all(0.0.w),
                      child: Hero(
                        tag: "reason:${widget.index}",
                        child: Material(
                          child: AutoSizeText(
                            widget.reason ?? "",
                            style: FlutterFlowTheme.of(context)
                                .labelExtraSmall
                                .override(
                                    useGoogleFonts: false,
                                    fontWeight: FontWeight.w400,
                                    color: FlutterFlowTheme.of(context)
                                        .fixedBlack
                                        .withOpacity(.50)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0.h,
              ),
              allPaths != null
                  ? Expanded(
                      child: PathListView(
                      goal: widget.goals,
                      allPaths: allPaths,
                    )): Container()
            ],
                    ),
                  ),
          )),
    );
  }
}
