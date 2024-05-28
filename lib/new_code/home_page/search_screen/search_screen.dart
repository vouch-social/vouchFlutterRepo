import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/bounty_screen/bounty_screen.dart';
import 'package:vouch/new_code/home_page/search_screen/search_controller.dart';
import 'package:vouch/new_code/home_page/search_screen/search_prompt_widget.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../common_widgets/image_check.dart';
import '../paths_screen/paths_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = Get.put(SearchScreenController());
  bool _showSendIcon = false;
  bool _sendIconPressed = false;
  String _userInput = '';
  var responseData;

  @override
  Widget build(BuildContext context) {
    final colors = [
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
    ];

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: const CustomAppBar(
        showBackButton: true,
        showHistoryButton: false,
        showNotificationButton: false,
        showProfileButton: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_sendIconPressed)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(16.0.w),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textFieldBackground,
                          borderRadius: BorderRadius.circular(12.0.w),
                        ),
                        child: Text(
                          _userInput,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Container(
                      height: 24.0.h,
                      width: 24.0.w,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0.w),
                        border: Border.all(
                            color: FlutterFlowTheme.of(context).textFieldBackground),
                      ),
                      child: Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3),
                        size: 10.0.w,
                      ),
                    ),
                  ],
                ),
              if (_sendIconPressed) SizedBox(height: 12.0.h),
              if (_sendIconPressed)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 136.0.h,
                      child: Obx(() {
                        if (_controller.isSearchLoading.value ) {
                          return Center(
                            child: Lottie.network(
                              "https://lottie.host/ed886f82-2d00-4bf4-96df-323151092289/hjRRpMdcX5.json",
                              frameRate: FrameRate(30.0),
                              height: 124.0.h,
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                          );
                        } else if (responseData.searchData == null ||
                            responseData.searchData.isEmpty) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Lottie.network(
                                  "https://lottie.host/b5a24d04-69db-4e87-8f86-21a5243a42a3/xjn2UrFym3.json",
                                  frameRate: FrameRate(30.0),
                                  height: 104.0.h,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                              SizedBox(height: 4.0.h,),
                              SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText("We cannot provide recommendations for the query provided. Kindly try something else.",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context).labelExtraSmall,
                                  ))
                            ],
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: responseData.searchData.length,
                            itemBuilder: (BuildContext context, int index) {
                              var recommendations = responseData.searchData[index];
                              return Obx(
                                    () => Skeletonizer(
                                  enabled: _controller.isSearchLoading.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => PathsScreen(
                                        name: recommendations.name,
                                        hashedPhone: recommendations.hashedphone,
                                        image: recommendations.photourl,
                                        index: index,
                                        headline: recommendations.localizedheadline,
                                        goals: _userInput,
                                        reason: recommendations.reason,
                                      ));
                                    },
                                    child: Container(
                                      width: 200.0.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.0.w),
                                          color: colors[0]),
                                      margin: EdgeInsets.only(right: 8.0.w, top: 8.w),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Hero(
                                              tag: "image:$index",
                                              child: Material(
                                                color: Colors.transparent,
                                                child: CustomCircleAvatar(
                                                  imageUrl: recommendations.photourl,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.0.h),
                                            Hero(
                                              tag: "name:$index",
                                              child: Material(
                                                color: Colors.transparent,
                                                child: AutoSizeText(
                                                  recommendations.name,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                    color: FlutterFlowTheme.of(context)
                                                        .fixedBlack,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4.0.h),
                                            Hero(
                                              tag: "headline:$index",
                                              child: Material(
                                                color: Colors.transparent,
                                                child: AutoSizeText(
                                                  recommendations.localizedheadline,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(context)
                                                      .labelExtraSmall
                                                      .override(
                                                    color: FlutterFlowTheme.of(context)
                                                        .fixedBlack,
                                                    useGoogleFonts: false,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4.0.h,),
                                            Hero(
                                              tag: "reason:$index",
                                              child: Material(
                                                color: Colors.transparent,
                                                child: AutoSizeText(
                                                  "${recommendations.reason ?? "No Reason Found"}  ",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(context)
                                                      .labelExtraSmall
                                                      .override(
                                                    color: FlutterFlowTheme.of(context)
                                                        .fixedBlack,
                                                    useGoogleFonts: false,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                    SizedBox(height: 12.0.h),
                    Container(
                      padding: EdgeInsets.all(8.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0.w),
                        color: FlutterFlowTheme.of(context).textFieldBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            "Didn't find what you want?",
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                          SizedBox(width: 4.0.w),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => BountyScreen());
                            },
                            child: AutoSizeText(
                              "Raise a bounty",
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                useGoogleFonts: false,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              if (!_sendIconPressed) SearchPromptWidget(onSuggestionTap: (suggestion ) {
                setState(() {
                  _userInput = _controller.searchController.text;
                  _showSendIcon = true;
                });
              },),
              SizedBox(height: 20.0.h),
              if (_sendIconPressed) Spacer(),
              Row(
                children: [
                  Hero(
                    tag: "Search",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 88.w,
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: FlutterFlowTheme.of(context).textFieldBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).textFieldBackground,
                          ),
                        ),
                        child: TextFormField(
                          controller: _controller.searchController,
                          style: FlutterFlowTheme.of(context).titleSmall,
                          minLines: 1,
                          maxLines: 4,
                          autofocus: true,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          onChanged: (text) {
                            setState(() {
                              _showSendIcon = text.trim().isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search by query/context or Raise a bounty->",
                            hintStyle: FlutterFlowTheme.of(context).titleSmall,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  GestureDetector(
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Icon(
                        _showSendIcon ? Icons.send : Icons.add,
                        color: FlutterFlowTheme.of(context).white,
                      ),
                    ),
                    onTap: () async {
                      if (_showSendIcon &&
                          _controller.searchController.text.isNotEmpty) {
                        setState(() {
                          _sendIconPressed = true;
                          _userInput = _controller.searchController.text;
                          _controller.searchController.clear();
                          _showSendIcon = false;
                        });
                        var _responseData = await _controller.getSearchData(_userInput);
                        setState(() {
                          responseData = _responseData;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

