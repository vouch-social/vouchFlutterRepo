import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../generated/assets.dart';
import '../../common_widgets/vector.dart';
import 'bounty_controller.dart';

class BountyScreen extends StatefulWidget {
  const BountyScreen({super.key});

  @override
  State<BountyScreen> createState() => _BountyScreenState();
}

class _BountyScreenState extends State<BountyScreen> {
  List<String> bountyTags = [];
  int sliderValue = 2;
  final controller = Get.put(BountyController());

  void _handleChipSelection(String text) {
    setState(() {
      controller.toggleChipSelection(text);
      print(controller.selectedContexts);
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      if (value <= 0.33) {
        controller.updateResponseTime(ResponseTime.Immediately);
        sliderValue = 1;
      } else if (value <= 0.66) {
        controller.updateResponseTime(ResponseTime.Within24Hrs);
        sliderValue = 2;
      } else {
        controller.updateResponseTime(ResponseTime.Within72Hrs);
        sliderValue = 3;
      }
    });
  }

  Future<void> fetchBountyTags() async {
    var fetchedTags = await controller.getBountyTags();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        bountyTags = fetchedTags.bountyTagsAll;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBountyTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Raise a new',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              AutoSizeText(
                'Bounty',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              SizedBox(
                height: 24.h,
              ),
              AutoSizeText(
                'I’m looking to connect to',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0.w),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(.20),
                  ),
                ),
                child: TextFormField(
                  controller: controller.linkedinUrlController,
                  minLines: 2,
                  maxLines: 4,
                  style: FlutterFlowTheme.of(context).labelSmall,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).textFieldBackground,
                    contentPadding: EdgeInsets.only(left: 24.0.w, top: 20, bottom: 20),
                    hintText: "Enter the LinkedIn URL",
                    hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0.w),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0.h,
              ),
              AutoSizeText(
                'In the context of',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              bountyTags.isEmpty ?  Center(child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              )):
              Obx(
                () => Skeletonizer(
                  enabled: controller.isLoading.value,
                  child: Wrap(
                    spacing: 4.0.w,
                    children: bountyTags.map((tag) => _buildChip(tag)).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0.h,
              ),
              AutoSizeText(
                'Hoping for a response',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Slider.adaptive(
                activeColor: FlutterFlowTheme.of(context).sliderActive,
                inactiveColor: FlutterFlowTheme.of(context).pastelBlue,
                thumbColor: FlutterFlowTheme.of(context).primaryText,
                divisions: 2,
                value: (sliderValue - 1) / 2,
                onChanged: _onSliderChanged,
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Immediately\nless then 24 hrs',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      color: sliderValue == 1
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(width: 4.0.w),
                  AutoSizeText(
                    'With in\n24 hrs',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      color: sliderValue == 2
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(width: 40.0.w),
                  AutoSizeText(
                    'With in\n72 hrs',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w400,
                      color: sliderValue == 3
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  await controller.sendRaisedBounty(sliderValue);
                  controller.linkedinUrlController.clear();
                  controller.bountyContextController.clear();
                  Get.to(() => NewHomePage());
                },
                text: 'Ask Network',
                options: CTAButton(context),
              ),
              SizedBox(
                height: 4.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    final bool isSelected = controller.selectedContexts.contains(label);

    return GestureDetector(
      onTap: () {
        _handleChipSelection(label);
      },
      child: Chip(
        elevation: 0.0,
        backgroundColor: isSelected
            ? FlutterFlowTheme.of(context).accent1
            : MediaQuery.of(context).platformBrightness == Brightness.dark
            ? FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.9)
            : FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.1),
        label: Text(
          label,
          style: isSelected
              ? FlutterFlowTheme.of(context).labelExtraSmall.copyWith(color: FlutterFlowTheme.of(context).fixedBlack)
              : FlutterFlowTheme.of(context).labelExtraSmall,
        ),
      ),
    );
  }
}

