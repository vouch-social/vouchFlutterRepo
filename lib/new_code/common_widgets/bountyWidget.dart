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
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0.w),
          color: FlutterFlowTheme.of(context).primaryBackground,
      border: Border.all(color: FlutterFlowTheme.of(context).textFieldBackground)
    ),
    padding: EdgeInsets.all(12.0.w),
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
                child: Image.asset(Assets.assetsImage951,
                fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 8.0.w,),
            AutoSizeText(
              'Shivani Narasimhan',style: FlutterFlowTheme.of(context).bodyLarge
            ),
            Spacer(),
            AutoSizeText('Immediately',
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3)
                )
            )
          ],
        ),
       SizedBox(height: 8.0.h,),
        Divider(
          color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
          height: 0.0,
        ),
        SizedBox(
          height: 8.0.h,
        ),
        AutoSizeText('Want to Connect with IT company CEO for business consulting and services.',
        style: FlutterFlowTheme.of(context).labelExtraSmall.override(
          useGoogleFonts: false,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,),
        ),
        SizedBox(height: 8.0.h,),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 4.0.w,horizontal: 12.0.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0.w),
                  color: FlutterFlowTheme.of(context).green1.withOpacity(0.9)
              ),
              child: AutoSizeText(
                  'Business',
                  style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
            SizedBox(width: 8.0.w,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 4.0.w,horizontal: 12.0.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0.w),
                  color: FlutterFlowTheme.of(context).green1.withOpacity(0.9)
              ),
              child: AutoSizeText(
                  'Volunteering',
                  style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      useGoogleFonts: false,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400
                  )
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.0.h,
        ),
        Divider(
          color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.2),
          height: 0.0,
        ),
        SizedBox(
          height: 12.0.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.access_time,size: 16.0.w,color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),),
                SizedBox(
                  width: 4.0.w,
                ),
                AutoSizeText('22 Min ago',style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                    useGoogleFonts: false,
                    fontWeight: FontWeight.w400,
                    color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3)
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 6.0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.w),
                      color: Colors.transparent,
                    border: Border.all(color: FlutterFlowTheme.of(context).primaryText)
                  ),
                  child: AutoSizeText(
                      'Ignore',
                      style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                          useGoogleFonts: false,
                          fontWeight: FontWeight.w400,
                      )
                  ),
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 6.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.w),
                    color: FlutterFlowTheme.of(context).ffButton,
                  ),
                  child: AutoSizeText(
                      'Hunt',
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
  );
}