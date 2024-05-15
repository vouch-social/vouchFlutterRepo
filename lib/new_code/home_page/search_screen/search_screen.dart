import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/bounty_screen/bounty_screen.dart';
import 'package:vouch/new_code/home_page/search_screen/search_controller.dart';
import 'package:vouch/new_code/home_page/search_screen/search_prompt_widget.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
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

  final List<String> images = [
    'assets/image951.png',
    "assets/image951.png",
    'assets/image951.png',
    'assets/image951.png',
    'assets/image951.png'
  ];

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
      appBar: CustomAppBar(
        showBackButton: true,
        showHistoryButton: false,
        showNotificationButton: false,
        showProfileButton: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              if (_sendIconPressed)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        //width: double.infinity,
                        padding: EdgeInsets.all(16.0.w),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).textFieldBackground,
                          borderRadius: BorderRadius.circular(12.0.w),
                        ),
                        child: Text(
                          _userInput,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Container(
                      height: 24.0.h,
                      width: 24.0.w,
                      decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(12.0.w),
                          border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .textFieldBackground)),
                      child: Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3),
                        size: 10.0.w,
                      ),
                    )
                  ],
                ),
              if (_sendIconPressed) SizedBox(height: 12.0.h),
              if (_sendIconPressed && responseData != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(12.0.w),
                            color: colors[0]),
                        margin:
                        EdgeInsets.only(right: 8.0.w, top: 8.w),
                        child: Padding(
                          padding: EdgeInsets.all(12.0.w),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "image:${0}",
                                child: Material(
                                    color: Colors.transparent,
                                    child: CircleAvatar(
                                      radius: 18.0.w,
                                      child: responseData.searchData[0]
                                          .photourl !=
                                          null ||
                                          Image.network(
                                              responseData.searchData[0]
                                                  .photourl)
                                              .errorBuilder !=
                                              null
                                          ? Image.network(
                                          responseData.searchData[0]
                                              .photourl)
                                          : Image.asset(
                                          images[0]),
                                    )),
                              ),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              Hero(
                                tag: "name:${0}",
                                child: Material(
                                  color: Colors.transparent,
                                  child: AutoSizeText(
                                    responseData.searchData[0].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                    FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      color:
                                      FlutterFlowTheme.of(
                                          context)
                                          .fixedBlack,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.0.h),
                              Hero(
                                tag: "headline:${0}",
                                child: Material(
                                  color: Colors.transparent,
                                  child: AutoSizeText(
                                      responseData.searchData[0]
                                          .localizedheadline,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(
                                          context)
                                          .labelExtraSmall
                                          .override(
                                          color:
                                          FlutterFlowTheme.of(
                                              context)
                                              .fixedBlack,
                                          useGoogleFonts: false,
                                          fontWeight:
                                          FontWeight.w300)),
                                ),
                              ),
                              SizedBox(
                                height: 16.0.h,
                              ),
                              Hero(
                                tag: "goal:${0}",
                                child: Material(
                                  color: Colors.transparent,
                                  child: AutoSizeText(
                                      responseData.searchData[0].goals
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(
                                          context)
                                          .labelExtraSmall
                                          .override(
                                          color:
                                          FlutterFlowTheme.of(
                                              context)
                                              .fixedBlack,
                                          useGoogleFonts: false,
                                          fontWeight:
                                          FontWeight.w400)),
                                ),
                              )
                            ],
                          ),
                        )),
                    // Container(
                    //  // height: 200,
                    //   //color: FlutterFlowTheme.of(context).fixedWhite,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: const BouncingScrollPhysics(),
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: responseData.searchData != null
                    //         ? responseData.searchData?.length - 1
                    //         : 0,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       if (responseData.searchData == null ||
                    //           index >= responseData.searchData.length) {
                    //         return const SizedBox();
                    //       }
                    //       print(
                    //           ' Data length: ${responseData.searchData.length}');
                    //       var recommendations = responseData.searchData[0];
                    //       print("length ${responseData.searchData.length}");
                    //       print(Image.network(recommendations.photourl)
                    //           .errorBuilder);
                    //       return Obx(
                    //             () => Skeletonizer(
                    //           enabled: _controller.isLoading.value,
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               Get.to(() => PathsScreen(
                    //                 name: recommendations.name,
                    //                 hashedPhone: recommendations.hashedphone,
                    //                 image: recommendations.photourl,
                    //                 index: index,
                    //                 headline:
                    //                 recommendations.localizedheadline,
                    //                 goals: recommendations.goals,
                    //               ));
                    //             },
                    //             child: Container(
                    //                 width: 200.w,
                    //                 decoration: BoxDecoration(
                    //                     borderRadius:
                    //                     BorderRadius.circular(12.0.w),
                    //                     color: colors[index]),
                    //                 margin:
                    //                 EdgeInsets.only(right: 8.0.w, top: 8.w),
                    //                 child: Padding(
                    //                   padding: EdgeInsets.all(12.0.w),
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                     children: [
                    //                       Hero(
                    //                         tag: "image:$index",
                    //                         child: Material(
                    //                             color: Colors.transparent,
                    //                             child: CircleAvatar(
                    //                               radius: 18.0.w,
                    //                               child: recommendations
                    //                                   .photourl !=
                    //                                   null ||
                    //                                   Image.network(
                    //                                       recommendations
                    //                                           .photourl)
                    //                                       .errorBuilder !=
                    //                                       null
                    //                                   ? Image.network(
                    //                                   recommendations
                    //                                       .photourl)
                    //                                   : Image.asset(
                    //                                   images[index]),
                    //                             )),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 8.0.h,
                    //                       ),
                    //                       Hero(
                    //                         tag: "name:$index",
                    //                         child: Material(
                    //                           color: Colors.transparent,
                    //                           child: AutoSizeText(
                    //                             recommendations.name,
                    //                             overflow: TextOverflow.ellipsis,
                    //                             maxLines: 1,
                    //                             style:
                    //                             FlutterFlowTheme.of(context)
                    //                                 .titleLarge
                    //                                 .override(
                    //                               color:
                    //                               FlutterFlowTheme.of(
                    //                                   context)
                    //                                   .fixedBlack,
                    //                               useGoogleFonts: false,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       SizedBox(height: 4.0.h),
                    //                       Hero(
                    //                         tag: "headline:$index",
                    //                         child: Material(
                    //                           color: Colors.transparent,
                    //                           child: AutoSizeText(
                    //                               recommendations
                    //                                   .localizedheadline,
                    //                               overflow: TextOverflow.ellipsis,
                    //                               maxLines: 1,
                    //                               style: FlutterFlowTheme.of(
                    //                                   context)
                    //                                   .labelExtraSmall
                    //                                   .override(
                    //                                   color:
                    //                                   FlutterFlowTheme.of(
                    //                                       context)
                    //                                       .fixedBlack,
                    //                                   useGoogleFonts: false,
                    //                                   fontWeight:
                    //                                   FontWeight.w300)),
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 16.0.h,
                    //                       ),
                    //                       Hero(
                    //                         tag: "goal:$index",
                    //                         child: Material(
                    //                           color: Colors.transparent,
                    //                           child: AutoSizeText(
                    //                               recommendations.goals
                    //                                   .toString(),
                    //                               overflow: TextOverflow.ellipsis,
                    //                               maxLines: 1,
                    //                               style: FlutterFlowTheme.of(
                    //                                   context)
                    //                                   .labelExtraSmall
                    //                                   .override(
                    //                                   color:
                    //                                   FlutterFlowTheme.of(
                    //                                       context)
                    //                                       .fixedBlack,
                    //                                   useGoogleFonts: false,
                    //                                   fontWeight:
                    //                                   FontWeight.w400)),
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 )),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 12.0.h,),
                    Row(
                      children: [
                        AutoSizeText("Didn't find what you want?",
                        style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(width: 4.0.w,),
                        AutoSizeText("Raise a bounty",
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            useGoogleFonts: false,
                            color: FlutterFlowTheme.of(context).primary
                          ),
                        ),
                      ],
                    ),

                  ],
                ),

              if (!_sendIconPressed) searchPromptWidget(context),
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
                          color:
                              FlutterFlowTheme.of(context).textFieldBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .textFieldBackground,
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
                              print("Text changed: $text");
                              print("Show send icon: $_showSendIcon");
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Type, talk, ask?",
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
                          //_controller.searchController.dispose();
                          _showSendIcon = false;
                          print("Send icon pressed");
                          print("User input: $_userInput");
                        });
                        var _responseData =
                            await _controller.getSearchData(_userInput);
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
