import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../backend/models/check_user_model.dart';
import '../../common_widgets/myAppBar.dart';
import 'edit_profile/edit_profile_controller.dart';

class EditAttributesListItem extends StatefulWidget {
  final dynamic serialNumber;
  final dynamic attributeId;
  final String text;
  final IconData icon;
  final VoidCallback onIconTap;
  final bool showIcon;

  const EditAttributesListItem({
    super.key,
    this.serialNumber,
    required this.text,
    required this.icon,
    required this.onIconTap,
    this.showIcon = true,
    this.attributeId,
  });

  @override
  State<EditAttributesListItem> createState() => _EditAttributesListItemState();
}

class _EditAttributesListItemState extends State<EditAttributesListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0.w),
      padding: widget.serialNumber != null
          ? EdgeInsets.all(16.0.w)
          : EdgeInsets.all(8.0.w),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).textFieldBackground,
        borderRadius: BorderRadius.circular(8.0.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.serialNumber != null
              ? AutoSizeText(
                  "${widget.serialNumber.toString()} .",
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).secondaryBackground),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: widget.serialNumber != null
                  ? EdgeInsets.symmetric(horizontal: 8.0.w)
                  : const EdgeInsets.symmetric(horizontal: 0.0),
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

class EditAttributesList extends StatefulWidget {
  final List<AttributesNew> items;

  const EditAttributesList({
    super.key,
    required this.items,
  });

  @override
  State<EditAttributesList> createState() => _EditAttributesListState();
}

class _EditAttributesListState extends State<EditAttributesList> {
  final _controller = Get.put(EditProfileController());
  final TextEditingController _textEditingController = TextEditingController();
  List<String>? _items = [];
  List<String> recommendationsData = [];
  List<dynamic>? attributesId = [];
  List<dynamic>? deleteAttributesId = [];

  @override
  void initState() {
    super.initState();
    _items = widget.items.map((e) => e.attribute).toList();
    attributesId = widget.items.map((e) => e.id).toList();
    print("Attributes ID: $attributesId");
    fetchRecommendations();
  }

  void _addItem(String item) {
    if (mounted) {
      setState(() {
        _items?.add(item);
      });
    }
    _textEditingController.clear();
  }

  void _removeItem(int index) {
    if (mounted) {
      setState(() {
        deleteAttributesId?.add(attributesId?.removeAt(index));
        print("deletedAttributes $deleteAttributesId");
        _items?.removeAt(index);
      });
    }
  }

  Future<void> fetchRecommendations() async {
    var fetchedRecommendations = await _controller.getAttributesExamples();
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
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Edit Attributes",
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
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _items?.length,
                    itemBuilder: (context, index) {
                      return EditAttributesListItem(
                        serialNumber: index + 1,
                        text: _items![index],
                        icon: Icons.clear,
                        onIconTap: () => _removeItem(index),
                      );
                    },
                  ),
                  SizedBox(height: 16.0.h),
                  CustomTextField(
                    controller: _textEditingController,
                    addItem: _addItem,
                  ),
                  SizedBox(height: 16.0.h),
                  AutoSizeText(
                    "Suggestions :",
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  SizedBox(height: 16.0.h),
                  Obx(() {
                    return _controller.isLoading.value
                        ? Center(
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context)
                            .secondaryBackground,
                      ),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recommendationsData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _textEditingController.text =
                              recommendationsData[index];
                            });
                          },
                          child: recommendationsData.isEmpty
                              ? Center(
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          )
                              : Skeletonizer(
                            enabled: _controller.isLoading.value,
                            child: EditAttributesListItem(
                              serialNumber: null,
                              text: recommendationsData[index],
                              icon: Icons.clear,
                              onIconTap: () {},
                              showIcon: false,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 16.0.w),
        child: FFButtonWidget(
          text: "Update Attributes",
          onPressed: () async {
            if (_items != null &&
                _items!.isNotEmpty &&
                deleteAttributesId!.isEmpty) {
              List<String> itemsCopy = List.from(_items!);
              print(_items);
              for (var item in itemsCopy) {
                if (item.isNotEmpty) {
                  print("Sending item: $item");
                  await _controller.sendNewAttributesController(item);
                } else {
                  print("Skipped a null or empty item");
                }
              }
              await checkUser();
              Get.back();
              print("No items to delete");
            } else if (_items != null &&
                _items!.isNotEmpty &&
                deleteAttributesId!.isNotEmpty) {
              // Delete items first
              List<dynamic> deleteCopy = List.from(deleteAttributesId!);
              for (var id in deleteCopy) {
                if (id != null) {
                  print("Deleting item with id: $id");
                  await _controller.deleteNewAttributesController(id);

                } else {
                  print("Skipped a null or empty delete ID");
                }
                if (mounted) {
                  setState(() {
                    attributesId = [];
                  });
                }
              }

              // Add new items after deletion
              List<String> itemsCopy = List.from(_items!);
              print(_items);
              for (var item in itemsCopy) {
                if (item.isNotEmpty) {
                  try {
                    print("Sending item: $item");
                    await _controller.sendNewAttributesController(item);
                  } catch (e) {
                    print("Error sending item: $e");
                  }
                } else {
                  print("Skipped a null or empty item");
                }
              }
              await checkUser();
              Get.back();
            } else if (_items == null && _items!.isEmpty) {
              Get.snackbar(
                "No Attributes to add ",
                "Please add some attributes",
              );
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

  const CustomTextField({
    super.key,
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
        borderRadius: BorderRadius.circular(8.0),
        color: FlutterFlowTheme.of(context).textFieldBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).ffButton.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              minLines: 1,
              maxLines: maxLines,
              autofocus: true,
              initialValue: initialValue,
              style: FlutterFlowTheme.of(context).labelSmall,
              controller: controller,
              cursorColor: FlutterFlowTheme.of(context).secondaryBackground,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelStyle: FlutterFlowTheme.of(context).titleSmall,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0.w),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.w),
                color: FlutterFlowTheme.of(context).ffButton,
              ),
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0.h,
              ),
            ),
            onTap: () {
              if (controller!.text.isNotEmpty) {
                addItem(controller!.text);
              }
            },
          ),
          SizedBox(width: 8.0.w),
        ],
      ),
    );
  }
}
