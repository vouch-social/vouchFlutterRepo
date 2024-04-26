import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';
class BountyContainer extends StatefulWidget {
  const BountyContainer({super.key});

  @override
  State<BountyContainer> createState() => _BountyContainerState();
}

class _BountyContainerState extends State<BountyContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: bountyWidget(context)),
      ),
    );
  }
}

Widget bountyWidget(context){
  return Container(
    width: double.infinity,
    height: 220.0.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0.w),
          color: FlutterFlowTheme.of(context).pastelBlue
    ),
    padding: EdgeInsets.all(12.0.w),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 36.0.h,
              width: 36.0.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0.w)
              ),
              child: CircleAvatar(
                child: Image.asset(Assets.assetsImage951)
              ),
            ),
            SizedBox(width: 8.0.w,),
            Column(
              children: [
                AutoSizeText(
                  'Shivani Narasimhan',style: FlutterFlowTheme.of(context).bodyLarge.override(
                  useGoogleFonts: false,
                  color: FlutterFlowTheme.of(context).fixedBlack
                ),
                ),
                // SizedBox(
                //   height: 4.0.h,
                // ),
                AutoSizeText(
                  'car dealer | used car sell',style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    color: FlutterFlowTheme.of(context).fixedBlack
                ),
                ),
              ],
            ),
            Spacer(),
            AutoSizeText('urgent',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    color: FlutterFlowTheme.of(context).green1.withOpacity(0.3)
                )
            )
          ],
        ),
        SizedBox(height: 12.0.h,),
        Padding(
          padding:  EdgeInsets.only(left: 36.0),
          child: Row(
            children: [
              Container(
                height: 32.0.h,
                //width: 84.0.w,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.w),
                    color: FlutterFlowTheme.of(context).textFieldBackground
                ),
                child: AutoSizeText(
                    'Volunteering',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                        fontSize: 10,
                        fontWeight: FontWeight.w400
                    )
                ),
              ),
              SizedBox(width: 8.0.w,),
              Container(
                height: 32.0.h,
                width: 84.0.w,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.w),
                    color: FlutterFlowTheme.of(context).textFieldBackground
                ),
                child: AutoSizeText(
                    'Volunteering',
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        useGoogleFonts: false,
                        color: FlutterFlowTheme.of(context).fixedBlack,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400
                    )
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Container(
          color: FlutterFlowTheme.of(context).textFieldBackground.withOpacity(0.50),
          child: AutoSizeText(
            'Want to find driver for car delivery, Want to find driver for car delivery, Want to find driver for car delivery,  Want to find driver for car delivery,  Want to find driver for car delivery,  Want to find driver for car delivery,  '
         ,style: FlutterFlowTheme.of(context).labelExtraSmall.override(
              useGoogleFonts: false,
              color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(0.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400
          )
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0.w),
                  color: FlutterFlowTheme.of(context).container3
              ),
              child: AutoSizeText(
                  'Hunt',
                  style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).fixedBlack,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
            SizedBox(
              width: 8.0.w,
            ),
            Container(

              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0.w),
                  color: FlutterFlowTheme.of(context).container3
              ),
              child: AutoSizeText(
                  'Ignore',
                  style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).fixedBlack,
                      fontWeight: FontWeight.w400,
                    fontSize: 10.sp,

                  )
              ),
            )
          ],
        )
      ],
    ),
  );
}