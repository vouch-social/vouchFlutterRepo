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

class AttributesListItem extends StatefulWidget {
  final dynamic serialNumber;
  final String text;
  final IconData icon;
  final VoidCallback onIconTap;
  final bool showIcon;  // Add this parameter

  const AttributesListItem({
    super.key,
     this.serialNumber,
    required this.text,
    required this.icon,
    required this.onIconTap,
    this.showIcon = true,
  });

  @override
  State<AttributesListItem> createState() => _AttributesListItemState();
}

class _AttributesListItemState extends State<AttributesListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0.w),
      padding: widget.serialNumber != null ? EdgeInsets.all(16.0.w) : EdgeInsets.all(8.0.w),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).textFieldBackground,
        borderRadius: BorderRadius.circular(8.0.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.serialNumber != null ?
          AutoSizeText(widget.serialNumber.toString(),style: FlutterFlowTheme.of(context).labelMedium.override(
            useGoogleFonts: false,
            color: FlutterFlowTheme.of(context).secondaryBackground
          ),) : Container(),
          Expanded(
            child: Padding(
              padding:  widget.serialNumber != null ? EdgeInsets.symmetric(horizontal: 8.0.w) : const EdgeInsets.symmetric(horizontal: 0.0),
              child: AutoSizeText(
                widget.text,
                style: FlutterFlowTheme.of(context).labelSmall,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          if (widget.showIcon)
            GestureDetector(
              onTap: widget.onIconTap,
              child: Icon(
                widget.icon,
                size: 16.0.w,
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
    _items = widget.items != null ? List.of(widget.items!) : [];
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
      appBar: const CustomAppBar(
        title: "Add Attributes",
        showBackButton: true,
        showProfileButton: false,
        showNotificationButton: false,
        showHistoryButton: false,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: RefreshIndicator(
    onRefresh: () async {
    await fetchRecommendations();
    },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                      maxLines: 3,
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
                                  // serialNumber: index + 1,
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 16.0.w, right: 16.0.w, bottom: 16.0.w),
        child: FFButtonWidget(
          text: "Update Attributes",
          onPressed: () async {
            if (_items.isNotEmpty) {
              List<String> itemsCopy = List.from(_items);
              for (var item in itemsCopy) {
                if (item.isNotEmpty) {
                  try {
                    print("Sending item: $item");
                    await _controller.sendNewAttributesController(item);

                    Get.back();
                  } catch (e) {
                    print("Error sending item: $e");
                  }
                } else {
                  print("Skipped a null or empty item");
                }
              }
            } else {
              print("No items to send");
            }
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

  const CustomTextField({super.key,
    this.controller,
    this.initialValue,
    this.maxLines,
    required this.addItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.w),
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
              textInputAction: TextInputAction.done,
              style: FlutterFlowTheme.of(context).labelSmall,
              controller: controller,
              autofocus: true,
              cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelStyle: FlutterFlowTheme.of(context).titleSmall,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0.w),
          GestureDetector(
            child: Container(
              padding:  EdgeInsets.all(8.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.w),
                color: FlutterFlowTheme.of(context).ffButton,
              ),
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20.0.h,
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