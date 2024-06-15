import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/generated/assets.dart';
import '/new_code/home_page/search_screen/search_controller.dart';

class SearchPromptWidget extends StatefulWidget {
  final Function(String) onSuggestionTap;
  const SearchPromptWidget({super.key, required this.onSuggestionTap});

  @override
  State<SearchPromptWidget> createState() => _SearchPromptWidgetState();
}

class _SearchPromptWidgetState extends State<SearchPromptWidget> {
  final controller = Get.put(SearchScreenController());
  var searchSuggestion;

  @override
  void initState() {
    super.initState();
    getSuggestions();
  }

  void getSuggestions()  {
    WidgetsBinding.instance.addPostFrameCallback((_)  {
       fetchSuggestions();
    });
  }

  Future<void> fetchSuggestions() async {
    var fetchedSuggestions = await controller.getSearchDemoMessage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        searchSuggestion = fetchedSuggestions.searchBarDemoMessages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.0.h,),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 56.0.h,
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(
                Assets.assetsWelcomeLogo,
                color: FlutterFlowTheme.of(context).ffButton,
              ),
            ),
          ),
          SizedBox(height: 24.0.h,),
          AutoSizeText("Who do you want to search for?",
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          const Spacer(),
          if (searchSuggestion == null)
            const SizedBox()
          else
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Obx(
                      () => Skeletonizer(
                    enabled: controller.isSuggestionLoading.value,
                    child: GestureDetector(
                      onTap: () {
                        widget.onSuggestionTap(searchSuggestion[index].body);
                        controller.searchController.text = searchSuggestion[index].body;
                        print("Text ${controller.searchController.text}");
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0.w),
                            border: Border.all(
                                color: FlutterFlowTheme.of(context).textFieldBackground
                            )
                        ),
                        padding: EdgeInsets.only(top: 12.0.w, bottom: 12.0.w, left: 16.0.w, right: 8.0.w),
                        margin: EdgeInsets.only(bottom: 8.0.h), // Add margin to separate the items
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(searchSuggestion[index].title,
                              style: FlutterFlowTheme.of(context).labelExtraSmall,
                            ),
                            SizedBox(height: 4.0.h,),
                            AutoSizeText(searchSuggestion[index].body,
                              minFontSize: 8,
                              style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  useGoogleFonts: false
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
