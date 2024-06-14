import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details_controller.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../main.dart';
import '../../common_widgets/myAppBar.dart';

class AttributesListItem extends StatelessWidget {
  final int serialNumber;
  final String text;
  final IconData icon;
  final VoidCallback onIconTap;
  final bool showIcon;  // Add this parameter

  const AttributesListItem({
    super.key,
    required this.serialNumber,
    required this.text,
    required this.icon,
    required this.onIconTap,
    this.showIcon = true,  // Default is to show the icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).textFieldBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$serialNumber.',
            style: FlutterFlowTheme.of(context).labelSmall,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: FlutterFlowTheme.of(context).labelSmall,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          if (showIcon)
            GestureDetector(
              onTap: onIconTap,
              child: Icon(
                icon,
                size: 16.0,
              ),
            ),
        ],
      ),
    );
  }
}

class AttributesList extends StatefulWidget {
  final List<String>? items;
  final IconData icon;

  const AttributesList({
    super.key,
    this.items,
    this.icon = Icons.clear,
  });

  @override
  State<AttributesList> createState() => _AttributesListState();
}

class _AttributesListState extends State<AttributesList> {
  final _controller = Get.put(UserDetailsController());
  final TextEditingController _textEditingController = TextEditingController();
  List<String> _items = [];
  List<String> recommendationsData = [];
  @override
  void initState() {
    super.initState();
    _items = widget.items!;
    fetchRecommendations();
  }

  void _addItem(String item) {
    setState(() {
      _items.add(item);
    });
    _textEditingController.clear();
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }



  Future<void> fetchRecommendations() async {
    var fetchedRecommendations =
    await _controller.getAttributesExamples();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        recommendationsData = fetchedRecommendations.attributes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Attributes",
        showBackButton: true,
        showProfileButton: false,
        showNotificationButton: false,
        showHistoryButton: false,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return AttributesListItem(
                        serialNumber: index + 1,
                        text: _items[index],
                        icon: widget.icon,
                        onIconTap: () => _removeItem(index),
                      );
                    },
                  ),
                  SizedBox(height: 16.0.h,),
                  CustomTextField(
                    controller: _textEditingController,
                    addItem: _addItem,
                  ),
                  SizedBox(height: 16.0.h),
                  AutoSizeText("Suggestions :",style: FlutterFlowTheme.of(context).bodyLarge,),
                  SizedBox(height: 16.0.h),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: recommendationsData.length,
                    itemBuilder: (context, index) {
                      return
                         GestureDetector(
                           onTap: (){
                             setState(() {
                               _textEditingController.text = recommendationsData[index];
                             });
                           },
                           child:
                           recommendationsData.isEmpty ?
                           Center(
                             child: CircularProgressIndicator(
                               color: FlutterFlowTheme.of(context).secondaryBackground,
                             ),
                           ):

                           Obx(
                             () => Skeletonizer(
                               enabled: _controller.isLoading.value,
                               child: AttributesListItem(
                                serialNumber: index + 1,
                                text: recommendationsData[index],
                                icon: widget.icon,
                                onIconTap: () {},
                                 showIcon: false,
                                                     ),
                             ),
                           ),
                         );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w,bottom: 16.0.w),
        child: FFButtonWidget(
          text: "Save Attributes",
          onPressed: () async{
            print("Attributes ${_items}");
            prefs?.setStringList(attributes, _items);
            await _controller.sendUserAttributesController(_items);
            Get.back();
          },
          options: CTAButton(context),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final dynamic initialValue;
  final int? maxLines;
  final void Function(String) addItem;

  const CustomTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.maxLines,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: FlutterFlowTheme.of(context).textFieldBackground,
          border: Border.all(
            color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
          )
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              minLines: 1,
              maxLines: maxLines,
              initialValue: initialValue,
              style: FlutterFlowTheme.of(context).labelExtraSmall,
              controller: controller,
              cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelStyle: FlutterFlowTheme.of(context).titleSmall,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0.w),
          GestureDetector(
            child: Container(
              // height: 20.h,
              // width: 20.w,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.w),
                color: FlutterFlowTheme.of(context).ffButton,
              ),
              child: Icon(
                Icons.send,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 16.0.h,
              ),
            ),
            onTap: () {
              if (controller!.text.isNotEmpty) {
                addItem(controller!.text);
              }
            },
          ),
          SizedBox(width: 8.0.w,)
        ],
      ),
    );
  }
}