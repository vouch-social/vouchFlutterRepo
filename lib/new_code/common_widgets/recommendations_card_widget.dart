import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'image_check.dart';

class RecommendationCardWidget extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String name;
  final String headline;
  final dynamic goal;
  final String reason;
  final int maxLine ;

  const RecommendationCardWidget({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.name,
    required this.headline,
     this.goal,
    required this.reason, required this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 200.0.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "image:$index",
            child: Material(
              color: Colors.transparent,
              child: CustomCircleAvatar(
                imageUrl: imageUrl,
              ),
            ),
          ),
          SizedBox(height: 8.0.h),
          Hero(
            tag: "name:$index",
            child: Material(
              color: Colors.transparent,
              child: AutoSizeText(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  color: FlutterFlowTheme.of(context).fixedBlack,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0.h),
          Hero(
            tag: "headline:$index",
            child: Material(
              color: Colors.transparent,
              child: AutoSizeText(
                headline,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLine,
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                  color: FlutterFlowTheme.of(context).fixedBlack,
                  useGoogleFonts: false,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          goal != ''?
          Column(
            children: [
              SizedBox(height: 4.0.h),
              Hero(
                tag: "goal:$index",
                child: Material(
                  color: Colors.transparent,
                  child: AutoSizeText(
                    goal,
                    overflow: TextOverflow.ellipsis,
                    maxLines:  1,
                    style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                      color: FlutterFlowTheme.of(context).fixedBlack,
                      useGoogleFonts: false,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ) : Container(),
          SizedBox(height: 4.0.h),
          Hero(
            tag: "reason:$index",
            child: Material(
              color: Colors.transparent,
              child: AutoSizeText(
                reason.isNotEmpty ? reason : "",
                overflow: TextOverflow.ellipsis,
                maxLines: maxLine,
                style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                  color: FlutterFlowTheme.of(context).fixedBlack,
                  useGoogleFonts: false,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
