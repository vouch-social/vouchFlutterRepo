import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import '/new_code/backend/models/my_vouch_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/common_widgets/myAppBar.dart';
import '/new_code/home_page/HomePage/controllers/vouch_connect_controller.dart';


class MyVouchDetailsScreen extends StatefulWidget {
  final MySelectedPathListDatum vouch;
  const MyVouchDetailsScreen({super.key, required this.vouch});

  @override
  State<MyVouchDetailsScreen> createState() => _MyVouchDetailsScreenState();
}

class _MyVouchDetailsScreenState extends State<MyVouchDetailsScreen> {

  final connectController = VouchConnectController();
  var vouchId;

  @override
  Widget build(BuildContext context) {
    print("Vouch Id ${widget.vouch.id}");
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: const CustomAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              SizedBox(height: 16.0.h,),
              Expanded(
                child: MyListView(pathData: widget.vouch.pathData,),
              ),
              SizedBox(
                height: 62.0.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).pastelBlue,
                    borderRadius: BorderRadius.circular(16.0.w)
                ),
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('Vouch details :',
                      style: FlutterFlowTheme.of(context).buttonText.override(
                          useGoogleFonts: false,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: FlutterFlowTheme.of(context).fixedBlack

                      ),
                    ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AutoSizeText(
                          widget.vouch.message,
                          maxLines: 10,
                          style: FlutterFlowTheme.of(context).buttonText.override(
                              useGoogleFonts: false,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: FlutterFlowTheme.of(context).fixedBlack
                          )
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FFButtonWidget(text: "Connect", onPressed: ()
              async{
                print("VOUCH ID: ${widget.vouch.id}");
                await connectController.connectVouchUser(widget.vouch.id);
              }, options: CTAButton(context)),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final PathData pathData;
  const MyListView({
    super.key,
    required this.pathData,

  });

  @override
  Widget build(BuildContext context) {
    var paths = pathData.path.reversed.toList();
    print("Json Encode: ${jsonEncode(paths)}");
    print("Heading: ${paths[0].heading}");
    return Column(
      children: [
        SizedBox(
          height: 16.0.h,
        ),

        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: paths.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Column
                  ///Icon
                  ///dottedline
                  Column(
                    children: [
                      index != 0
                          ? DottedLine(
                        dashLength: 2,
                        dashGapLength: 4,
                        lineThickness: 1,
                        dashRadius: 1,
                        dashColor: FlutterFlowTheme.of(context)
                            .ffButton
                            .withOpacity(0.6),
                        direction: Axis.vertical,
                        lineLength: 30.h,
                      )
                          : Container(
                        height: 30.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).primaryBackground,
                                borderRadius: BorderRadius.circular(10.0.w),
                                border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .ffButton
                                        .withOpacity(0.6),
                                    width: 1.0.w)),
                            height: 20.0.h,
                            width: 20.0.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).ffButton,
                                borderRadius: BorderRadius.circular(4.0.w)),
                            height: 8.0.h,
                            width: 8.0.w,
                          ),
                        ],
                      ),
                      index >= paths.length - 1
                          ? Container(
                        height: 30.h,
                      )
                          : DottedLine(
                        dashLength: 2,
                        dashGapLength: 4,
                        lineThickness: 1,
                        dashRadius: 1,
                        dashColor: FlutterFlowTheme.of(context)
                            .ffButton
                            .withOpacity(0.6),
                        // dashGapColor: Colors.red,
                        direction: Axis.vertical,
                        lineLength: 30.h,
                      ),
                    ],
                  ),

                  ///dottedline
                  DottedLine(
                    dashLength: 2,
                    dashGapLength: 4,
                    lineThickness: 1,
                    dashRadius: 1,
                    dashColor: FlutterFlowTheme.of(context)
                        .ffButton
                        .withOpacity(0.6),
                    // dashGapColor: Colors.red,
                    direction: Axis.horizontal,
                    lineLength: 24,
                  ),

                  ///Stack
                  ///Image
                  ///logo
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor:
                          FlutterFlowTheme.of(context).primaryText,
                          child: CustomCircleAvatar(
                            imageUrl: paths[index].image,
                          )
                      ),
                      paths[index].isRegistered
                          ? Container(
                          alignment: Alignment.center,
                          height: 20.0.h,
                          width: 20.0.w,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10.0.w),
                              color:
                              FlutterFlowTheme.of(context).ffButton),
                          child: SvgPicture.asset(
                            'assets/welcomeLogo.svg',
                            width: 16.0.w,
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                          ))
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  SizedBox(
                    width: 150.0.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          paths[index].name,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,

                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                        SizedBox(
                          //width: 180.0.w,
                          child: AutoSizeText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              paths[index].heading.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .labelExtraSmall
                          ),
                        )
                      ],
                    ),
                  ),

                  ///coloumn
                  ///Name
                  ///headline
                  // const Spacer(),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.access_time,
                  //       size: 16.0.w,
                  //       color: FlutterFlowTheme.of(context)
                  //           .primaryText
                  //           .withOpacity(0.3),
                  //     ),
                  //     SizedBox(
                  //       width: 4.0.w,
                  //     ),
                  //     AutoSizeText(
                  //       DateTimeFormat.relative(
                  //           relativeTo: DateTime.now(),
                  //           DateTime.fromMillisecondsSinceEpoch(1000),
                  //           ifNow: "Just Now..",
                  //           appendIfAfter: 'ago'
                  //       ),
                  //       style: FlutterFlowTheme.of(context)
                  //           .labelExtraSmall
                  //           .override(
                  //           useGoogleFonts: false,
                  //           fontWeight: FontWeight.w400,
                  //           color: FlutterFlowTheme.of(context)
                  //               .primaryText
                  //               .withOpacity(0.3)),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
