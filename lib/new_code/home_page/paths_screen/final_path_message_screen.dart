import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_controller.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_list_view.dart';

import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../backend/models/paths_model.dart';

class FinalPathMessageScreen extends StatefulWidget {
  final dynamic goal;
  final int currentIndex;
  final SinglePath singlePath;
  const FinalPathMessageScreen({super.key, required this.currentIndex, required this.singlePath,  this.goal});

  @override
  State<FinalPathMessageScreen> createState() => _FinalPathMessageScreenState();
}

class _FinalPathMessageScreenState extends State<FinalPathMessageScreen> {
  final controller = Get.put(PathsController());



  @override
  Widget build(BuildContext context) {

    final data = widget.singlePath.pathNode;

    Map<String, dynamic> pathNodeToMap(PathNode node) {
      return {
        "name": node.name,
        "contactHashedPhone": node.contactHashedPhone,
        "strengthToNext": node.strengthToNext,
        "isRegistered": node.isRegistered,
        "heading": node.heading,
        "image": node.image,
        "attributes": node.attributes
            .map((attr) => {
          "createdAt": attr.createdAt,
          "updatedAt": attr.updatedAt,
          "id": attr.id,
          "userId": attr.userId,
          "attributes": attr.attributes,
        })
            .toList(),
      };
    }
    List<Map<String, dynamic>> reversedPathNodes = data
        .map((node) => pathNodeToMap(node))
        .toList()
        .reversed
        .toList();
    int totalLength = data.length;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: CustomAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 76.0.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reversedPathNodes.length,
                      itemBuilder: (context, index) {
                        return vouchPath(context, reversedPathNodes, index,
                            reversedPathNodes.length, );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
              Row(
                children: [
                  AutoSizeText(
                      "Context: ",
                      style: FlutterFlowTheme.of(context).titleLarge),
                  AutoSizeText(
                      "${widget.goal}",
                      style: FlutterFlowTheme.of(context).bodySmall),
                ],
              ),
              SizedBox(height: 24.0.h),
              AutoSizeText("Type your message",
                  style: FlutterFlowTheme.of(context).titleLarge),
              SizedBox(height: 12.0.h),
              TextFormField(
                controller: controller.contextController,
                autofocus: true,
                minLines: 5,
                maxLines: 8,
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                style: FlutterFlowTheme.of(context).labelSmall,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).textFieldBackground,
                  contentPadding: EdgeInsets.all(12.0.w),
                  hintText: "Type here...",
                  hintStyle: FlutterFlowTheme.of(context).labelSmall,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0.w),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              AutoSizeText(
                'Please do not share any critical information as this message will be visible to all the persons between your path.',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              FFButtonWidget(
                  text: "Start Vouch",
                  onPressed: () async {

                    if (controller.contextController.text != '') {


                      await MyListView(
                        paths: widget.singlePath,
                        totalCount: widget.singlePath.length,
                        index: widget.currentIndex,
                        onPressed: (data) async {
                          List<Map<String, dynamic>> pathNodes = reversedPathNodes.reversed.toList();
                          print("PathList : $reversedPathNodes");
                          print(
                              'Button pressed in tab ${widget.currentIndex} with data: ${jsonEncode(reversedPathNodes)}');
                          print(
                              'Button pressed in tab ${widget.currentIndex} with strength: ${widget.singlePath.strength}');
                          print(
                              'Button pressed in tab ${widget.currentIndex} with length: ${widget.singlePath.length}');
                          await controller.sendPath(
                            pathList: pathNodes,
                            strength: widget.singlePath.strength ?? 0,
                            length:widget.singlePath.length,
                          );
                        },
                      ).onPressed(data[widget.currentIndex]);
                    }
                  },
                  options: CTAButton(context)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget vouchPath(context, pathItem, index, length, ) {
  print("PathItem : $pathItem");
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
               CustomCircleAvatar(
                 radius: 20.0.h,
                 imageUrl: pathItem[index]["image"],
               ),
                SizedBox(height: 4.0.h),
                SizedBox(
                  width: 64.w,
                  child: AutoSizeText(
                    '${pathItem[index]["name"]}',
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10.0,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
            Visibility(
              visible: index != length - 1 ? true : false,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0.h),
                      height: 4.0.h,
                      width: (MediaQuery.of(context).size.width -
                          56.0.w -
                          (length * 64.0.h)) /
                          (length - 1),
                      color:  FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.3)),
        
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

