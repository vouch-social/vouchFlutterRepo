import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/outline_button_widget.dart';
import 'package:vouch/new_code/home_page/history_screen/hunters_list_page.dart';
import 'package:vouch/new_code/home_page/history_screen/update_bounty_by_id_controller.dart';

import '../../main.dart';
import '../backend/backend_constants.dart';
import '../home_page/HomePage/controllers/update_bounty_status_controller.dart';
import '../home_page/history_screen/bounty_details_by_id.dart';
import 'common_button_widget.dart';

class MyBountyWidget extends StatefulWidget {
  final  bounty;
  final Function refreshCallback;
  const MyBountyWidget({super.key, this.bounty, required this.refreshCallback, });

  @override
  State<MyBountyWidget> createState() => _MyBountyWidgetState();
}

class _MyBountyWidgetState extends State<MyBountyWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = UpdateBountyByIdController();
    print(widget.bounty.expiry);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0.w),
            color: FlutterFlowTheme.of(context).textFieldBackground,
            border: Border.all(
                color: FlutterFlowTheme.of(context).textFieldBackground)),
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCircleAvatar(
                  radius: 20.0.w,
                  imageUrl: prefs!.getString(imageUrl),
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                AutoSizeText('${prefs!.getString(userName)}',
                    style: FlutterFlowTheme.of(context).bodyLarge),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16.0.w,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.3),
                    ),
                    SizedBox(
                      width: 4.0.w,
                    ),
                    AutoSizeText(
                      DateTimeFormat.relative(
                          relativeTo: DateTime.now(),
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.bounty.expiry * 1000),
                          ifNow: "Just Now..",
                          appendIfAfter: 'ago'),
                      style: FlutterFlowTheme.of(context)
                          .labelExtraSmall
                          .override(
                          useGoogleFonts: false,
                          fontWeight: FontWeight.w400,
                          color: FlutterFlowTheme.of(context)
                              .primaryText
                              .withOpacity(0.3)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.0.h,
            ),
            AutoSizeText(
              '${widget.bounty.message}',
              style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                useGoogleFonts: false,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (widget.bounty.hunters.length != 0) {
                            Get.to(() => BountyDetailsScreen(
                              bounty: widget.bounty,
                            ));
                          }
                        },
                        child: hunters(widget.bounty.hunters, context)),
                  ],
                ),
                //Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.bounty.bountyStatus == 'close'
                        ? AutoSizeText("Closed",
                        style: FlutterFlowTheme.of(context).bodyMedium)
                        : OutlineButtonWidget(
                      text: 'Close',
                      onTap: () async{
                        await controller.updateBountyById(widget.bounty.id, 'close', 0);
                        print("Calling refresh callback...");
                        await widget.refreshCallback(); 
                        print("Refresh callback completed.");
                      },
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    widget.bounty.bountyStatus == 'close'
                        ? Container()
                        : widget.bounty.hunters.length == 0
                        ? CustomButton(
                      text: "Extend",
                      onTap: () {
                        controller.updateBountyById(
                            widget.bounty.id, 'open', 2);
                      },
                    )
                        : GestureDetector(
                      child: CustomButton(
                        text: "Award",
                        onTap: () {
                          Get.to(() => BountyDetailsScreen(
                            bounty: widget.bounty,
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


// Widget myBountyWidget(context, bounty) {
//   var controller = UpdateBountyByIdController();
//   print(bounty.expiry);
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 8.0.w),
//     child: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0.w),
//           color: FlutterFlowTheme.of(context).textFieldBackground,
//           border: Border.all(
//               color: FlutterFlowTheme.of(context).textFieldBackground)),
//       padding: EdgeInsets.all(16.0.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomCircleAvatar(
//                 radius: 20.0.w,
//                 imageUrl: prefs!.getString(imageUrl),
//               ),
//               SizedBox(
//                 width: 8.0.w,
//               ),
//               AutoSizeText('${prefs!.getString(userName)}',
//                   style: FlutterFlowTheme.of(context).bodyLarge),
//               Spacer(),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.access_time,
//                     size: 16.0.w,
//                     color: FlutterFlowTheme.of(context)
//                         .primaryText
//                         .withOpacity(0.3),
//                   ),
//                   SizedBox(
//                     width: 4.0.w,
//                   ),
//                   AutoSizeText(
//                     DateTimeFormat.relative(
//                         relativeTo: DateTime.now(),
//                         DateTime.fromMillisecondsSinceEpoch(
//                             bounty.expiry * 1000),
//                         ifNow: "Just Now..",
//                         appendIfAfter: 'ago'),
//                     style: FlutterFlowTheme.of(context)
//                         .labelExtraSmall
//                         .override(
//                             useGoogleFonts: false,
//                             fontWeight: FontWeight.w400,
//                             color: FlutterFlowTheme.of(context)
//                                 .primaryText
//                                 .withOpacity(0.3)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 16.0.h,
//           ),
//           AutoSizeText(
//             '${bounty.message}',
//             style: FlutterFlowTheme.of(context).labelExtraSmall.override(
//                   useGoogleFonts: false,
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//           ),
//           SizedBox(
//             height: 20.0.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         if (bounty.hunters.length != 0) {
//                           Get.to(() => BountyDetailsScreen(
//                                 bounty: bounty,
//                               ));
//                         }
//                       },
//                       child: hunters(bounty.hunters, context)),
//                 ],
//               ),
//               //Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   bounty.bountyStatus == 'close'
//                       ? AutoSizeText("Closed",
//                           style: FlutterFlowTheme.of(context).bodyMedium)
//                       : OutlineButtonWidget(
//                           text: 'Close',
//                           onTap: () {
//                             controller.updateBountyById(bounty.id, 'close', 0);
//                           },
//                         ),
//                   SizedBox(
//                     width: 8.0.w,
//                   ),
//                   bounty.bountyStatus == 'close'
//                       ? Container()
//                       : bounty.hunters.length == 0
//                           ? CustomButton(
//                               text: "Extend",
//                               onTap: () {
//                                 controller.updateBountyById(
//                                     bounty.id, 'open', 2);
//                               },
//                             )
//                           : GestureDetector(
//                               child: CustomButton(
//                                 text: "Award",
//                                 onTap: () {
//                                   Get.to(() => BountyDetailsScreen(
//                                         bounty: bounty,
//                                       ));
//                                 },
//                               ),
//                             ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

Widget hunters(hunters, context) {
  if (hunters.length == 0) {
    return SizedBox(
      width: 48,
      height: 24,
      child: AutoSizeText(
        "Nobody is hunting",
        minFontSize: 0.0,
        style: FlutterFlowTheme.of(context).bodyLarge.override(
            useGoogleFonts: false,
            color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
            fontSize: 8.0,
            fontWeight: FontWeight.w400),
      ),
    );
  } else {
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: 24,
          child: Stack(
            children: [
              hunters.length >= 1
                  ? Positioned(
                      left: 0,
                      child: CustomCircleAvatar(
                        imageUrl: hunters[0].user.photourl,
                        radius: 12.0.w,
                      ))
                  : Container(),
              hunters.length >= 2
                  ? Positioned(
                      left: 12,
                      child: CustomCircleAvatar(
                        imageUrl: hunters[1].user.photourl,
                        radius: 12.0.w,
                      ))
                  : Container(),
              hunters.length >= 3
                  ? Positioned(
                      left: 24,
                      child: CustomCircleAvatar(
                        imageUrl: hunters[2].user.photourl,
                        radius: 12.0.w,
                      ))
                  : Container()
            ],
          ),
        ),
        SizedBox(
          width: 8.0.w,
        ),
        SizedBox(
          //padding: EdgeInsets.only(right: 24),
          width: 120,
          child: AutoSizeText(
            hunters.length == 1
                ? '${getFirstName(hunters[0].user.name)} is hunting'
                : hunters.length == 2
                    ? '${getFirstName(hunters[0].user.name)} & ${getFirstName(hunters[1].user.name)} are hunting'
                    : hunters.length >= 3
                        ? '${getFirstName(hunters[0].user.name)}, ${getFirstName(hunters[1].user.name)} & ${hunters.length - 2} more are hunting'
                        : "",
            minFontSize: 0.0,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                useGoogleFonts: false,
                color:
                    FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
                fontSize: 8.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

String getFirstName(String fullName) {
  List<String> nameParts = fullName.split(' ');
  String firstName = nameParts.isNotEmpty ? nameParts[0] : '';
  return firstName;
}
