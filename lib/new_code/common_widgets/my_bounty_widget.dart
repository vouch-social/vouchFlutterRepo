import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';

class MyBountyContainer extends StatefulWidget {
  const MyBountyContainer({super.key});

  @override
  State<MyBountyContainer> createState() => _MyBountyContainerState();
}

class _MyBountyContainerState extends State<MyBountyContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: myBountyWidget(context)),
      ),
    );
  }
}

Widget myBountyWidget(context) {
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
              Container(
                height: 40.0.h,
                width: 40.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0.w),
                ),
                child: CircleAvatar(
                  child: Image.asset(
                    Assets.assetsImage951,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 8.0.w,
              ),
              AutoSizeText('Shivani Narasimhan',
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
                    '22 Min ago',
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
            'Want to Connect with IT company CEO for business consulting and services.',
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
                  SizedBox(
                    width: 48,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CircleAvatar(
                              child: Image.asset(Assets.assetsImage951),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CircleAvatar(
                              child: Image.asset(Assets.assetsImage951),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CircleAvatar(
                              child: Image.asset(Assets.assetsImage951),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.0.w,),
                  Container(
                    //padding: EdgeInsets.only(right: 24),
                    width: 120,
                    child: AutoSizeText(
                      'Animesh, Ankit and 5 others are hunting',
                      minFontSize: 0.0,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                          useGoogleFonts: false,
                          color: FlutterFlowTheme.of(context)
                              .primaryText
                              .withOpacity(0.5),
                          fontSize: 8.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              //Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 6.0.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0.w),
                        color: Colors.transparent,
                        border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText)),
                    child: AutoSizeText('Close',
                        style: FlutterFlowTheme.of(context)
                            .labelExtraSmall
                            .override(
                              useGoogleFonts: false,
                              fontWeight: FontWeight.w400,
                            )),
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  Container(
                    //height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 6.0.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0.w),
                        color: FlutterFlowTheme.of(context).ffButton,
                        border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .primaryBackground)),
                    child: AutoSizeText('Award',
                        style: FlutterFlowTheme.of(context).buttonText.override(
                            useGoogleFonts: false,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400)),
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
