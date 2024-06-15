import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '/new_code/common_widgets/common_button_widget.dart';
import '/new_code/common_widgets/myAppBar.dart';
import '/new_code/common_widgets/outline_button_widget.dart';

import '../../../common_widgets/horizontal_path_list_view.dart';


class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

List<dynamic> image = [
  'kjfklafkvnksdnvsvnj',
  'kjfklafkfasnfjsafasdkfkadsjflasdf',
  'kjfklafkvnksdnvsvnj',
  'kjfklafkfasnfjsafasdkfkadsjflasdf',
  'kjfklafkvnksdnvsvnj',
  'kjfklafkfasnfjsafasdkfkadsjflasdf',
];

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 76.0.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        print("Image Length : ${image.length}");
                        return vouchPathList(context, image, index, 5);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                ],
              ),
              SizedBox(height: 16.0.h,),
              Container(
                padding: EdgeInsets.all(12.0.w),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).pastelBlue,
                  borderRadius: BorderRadius.circular(12.0.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Vouch Details :",
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                      ),
                    ),
                    SizedBox(height: 8.0.h,),
                    AutoSizeText(
                      "Want to find driver for car delivery, Want to find driver for car delivery.Want to find driver for car delivery, Want to find driver for car delivery.Want to find driver for car delivery, Want to find driver for car delivery.Want to find driver for car delivery, Want to find driver for car delivery.",
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64.0.h,),
              Container(
                padding: EdgeInsets.all(12.0.w),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).pastelTint,
                  borderRadius: BorderRadius.circular(12.0.w),
                ),
                child: Column(
                  children: [
                    AutoSizeText(
                      "Was the vouch user able to help you?",
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                      ),
                    ),
                    SizedBox(height: 24.0.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlineButtonWidget(
                          onTap: () {},
                          text: "No",
                          textStyle: FlutterFlowTheme.of(context).labelExtraSmall.override(
                            useGoogleFonts: false,
                            color: FlutterFlowTheme.of(context).fixedBlack,
                          ),
                          borderColor: FlutterFlowTheme.of(context).fixedBlack,
                        ),
                        SizedBox(width: 24.0.w,),
                        CustomButton(text: "Yes", onTap: () {})
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

