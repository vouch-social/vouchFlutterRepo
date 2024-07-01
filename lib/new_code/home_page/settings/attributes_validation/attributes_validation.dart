import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import '../../../common_widgets/attributes_validation_card.dart';
import 'attributes_validation_controller.dart';

class AttributesValidation extends StatefulWidget {
  const AttributesValidation({super.key});

  @override
  State<AttributesValidation> createState() => _AttributesValidationState();
}

class _AttributesValidationState extends State<AttributesValidation> {
  var attributesValidationData = [];

  final controller = Get.put(AttributesValidationController());

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await fetchAttributesValidation();
    });
  }

  Future<void> fetchAttributesValidation() async {
    var fetchedData = await controller.getAttributesValidationData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        attributesValidationData = fetchedData.responseData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        showProfileButton: false,
        showHistoryButton: true,
        showNotificationButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Obx(() => Skeletonizer(
                enabled: controller.isLoading.value,
                child: controller.isLoading.value == false
                    ?(  attributesValidationData.isNotEmpty ? ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        itemCount: attributesValidationData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var attributes = attributesValidationData[index];
                          return AttributesValidationCard(
                            attributesValidation: attributes,
                            refreshFeeds: fetchAttributesValidation,
                          );
                        },
                      ):  AutoSizeText("No Attributes for validation",style: FlutterFlowTheme.of(context).titleLarge,)): Center(
                        child: CircularProgressIndicator(
                                     color: FlutterFlowTheme.of(context).secondaryBackground,
                                        ),
                      )
                    ))),
      ),
    );
  }
}
