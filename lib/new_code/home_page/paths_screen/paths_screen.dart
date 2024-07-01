import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_list_view.dart';
import '../../common_widgets/myAppBar.dart';
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
  dynamic userData;
  var isLoading = false;

  void fetchPaths() async {
    var fetchedPaths;
    if (Get.arguments != null && Get.arguments['hashedPhone'] != null) {
      fetchedPaths = await controller.getPathsList(Get.arguments['hashedPhone']);
    } else {
      fetchedPaths = await controller.getPathsList(widget.hashedPhone);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      setState(() {
        allPaths = fetchedPaths;
        if (fetchedPaths != null && fetchedPaths.singlePathList.isNotEmpty) {
          userData = fetchedPaths.singlePathList[0].pathNode[0];
        }
        isLoading = false;
      });
    });
  }


  void _initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isLoading = true;
      });
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
                            imageUrl: widget.image ?? userData?.image ?? 'vouch',
                            radius: 64.0.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      Hero(
                        tag: "name:${widget.index}",
                        child: Material(
                          color: Colors.transparent,
                          child: AutoSizeText(
                            widget.name ?? userData?.name ?? '',
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
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Hero(
                          tag: "headline:${widget.index}",
                          child: Material(
                            color: Colors.transparent,
                            child: AutoSizeText(
                              widget.headline ?? userData?.heading ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                  useGoogleFonts: false,
                                  color: FlutterFlowTheme.of(context).fixedBlack),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: widget.goals == '' || widget.goals == null ? Colors.transparent : FlutterFlowTheme.of(context).pastelTint,
                          borderRadius: BorderRadius.circular(0.0.w),
                        ),
                        padding: EdgeInsets.all(4.0.w),
                        child: Hero(
                          tag: "goal:${widget.index}",
                          child: Material(
                            color: Colors.transparent,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 32.0.w,
                              child: AutoSizeText(
                                widget.goals ?? '',
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
                      ),
                      SizedBox(
                        height: 8.0.h,
                      ),
                      Container(
                        width: double.infinity - 32.0.w,
                        decoration: BoxDecoration(
                          color: widget.reason == '' || widget.reason == null ? FlutterFlowTheme.of(context).fixedWhite :FlutterFlowTheme.of(context).pastelBlue,
                          borderRadius: BorderRadius.circular(4.0.w),
                        ),
                        padding: EdgeInsets.all(4.0.w),
                        child: Hero(
                          tag: "reason:${widget.index}",
                          child: Material(
                            color: Colors.transparent,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 32.0.w,
                              child: AutoSizeText(
                                widget.reason ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
