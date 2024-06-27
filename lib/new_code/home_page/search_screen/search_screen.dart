import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/common_widgets/recommendations_card_widget.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
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
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
    ];
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar:  CustomAppBar(
          onBackButtonPressed: (){
            Get.to(() => const NewHomePage());
          },
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
                        height: 160.0.h,
                        child: Obx(() {
                          if (_controller.isSearchLoading.value ) {
                            return Center(
                              child: Lottie.network(
                                'https://lottie.host/3d8f7b70-2fdf-4192-b93c-afde40d44a6b/PS3ttkgWzx.json',
                                frameRate: FrameRate(30.0),
                                fit: BoxFit.cover,
                                animate: true,
                              ),
                            );
                          } else if (responseData.searchData == null ||
                              responseData.searchData.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(

                                    child: Lottie.network(
                                      "https://lottie.host/b5a24d04-69db-4e87-8f86-21a5243a42a3/xjn2UrFym3.json",
                                      fit: BoxFit.cover,
                                      height: 128.0.h,
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
                              ),
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
                                        margin: EdgeInsets.only(
                                          right: 8.0.w, top: 8.w),
                                        padding: EdgeInsets.all(12.0.w),
                                        decoration: BoxDecoration(
                                          color: colors[index],
                                          borderRadius: BorderRadius.circular(12.0.w)
                                        ),
                                        child: RecommendationCardWidget(
                                          name: recommendations.name,
                                          headline: recommendations.localizedheadline,
                                          index: index,
                                          imageUrl: recommendations.photourl,
                                          goal: '',
                                          reason: recommendations.reason ?? '',
                                          maxLine: 2,
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
                                Get.to(() => const BountyScreen());
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
                          width: MediaQuery.of(context).size.width - 88.0.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
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
                            textInputAction: TextInputAction.done,
                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                            onChanged: (text) {
                              setState(() {
                                print("Text : $text");
                                _showSendIcon = text.trim().isNotEmpty;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search for professionals, topics, or interests",
                              hintStyle: FlutterFlowTheme.of(context).labelExtraSmall,
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
                        }else{
                          Get.to(
                                  transition: Transition.downToUp,
                                  () => BountyScreen());
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

