import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/backend/models/paths_model.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_list_view.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

import '../../../generated/assets.dart';
import '../../common_widgets/vector.dart';

class PathsScreen extends StatefulWidget {
  final PathsModel pathsModel;
  final dynamic name;
  final dynamic image;
  final dynamic headline;
  final dynamic goals;
  final dynamic index;
  const PathsScreen({super.key,  this.name, this.image, this.headline,  this.goals, this.index, required this.pathsModel});

  @override
  State<PathsScreen> createState() => _PathsScreenState();
}


class _PathsScreenState extends State<PathsScreen> {
  @override
  Widget build(BuildContext context) {
    print("Path Path : ${widget.pathsModel.data.paths[0].path[0].image}");
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).fixedWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(16.0.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.0.w),
                              color: FlutterFlowTheme.of(context).fixedWhite,
                              border: Border.all(
                                  color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(.20)
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_back,color: FlutterFlowTheme.of(context).fixedBlack,),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to( () => SettingsScreen());
                        },
                        child: Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0.w),
                                color: FlutterFlowTheme.of(context).accent4),
                            child: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: vector(Assets.assetsUserIcon,
                                  height: 20.h, width: 20.w),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Container(
                    height: 124.0.h,
                    width: 124.0.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(62.0.w),
                    ),
                    child: Hero(
                      tag:"image:$widget.index",
                      child: Material(
                        color: Colors.transparent,
                        child: ClipOval(
                          child: Image.network(
                            widget.pathsModel.data.paths[0].path[0].image == null ?
                            "https://media.licdn.com/dms/image/C5603AQEFnqHFu0ougw/profile-displayphoto-shrink_100_100/0/1517460846161?e=1715212800&v=beta&t=3d7rHcIDt_64AW55zFyWNnBhdeN_YtMMVuSE-qbRmVA" :
                            widget.pathsModel.data.paths[0].path[0].image ,
                            fit: BoxFit.fill,
                            width: 124.0.w,
                            height: 124.0.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  Hero(
                    tag: "name:$widget.index",
                    child: Material(
                      color: Colors.transparent,
                      child: AutoSizeText(widget.pathsModel.data.paths[0].path[0].name,
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                          useGoogleFonts: false,
                          color: FlutterFlowTheme.of(context).fixedBlack
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 48.0.w),
                    child: Hero(
                      tag: "headline:$widget.index",
                      child: Material(
                        color: Colors.transparent,
                        child: AutoSizeText(widget.pathsModel.data.paths[0].path[0].heading,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                useGoogleFonts: false,
                                color: FlutterFlowTheme.of(context).fixedBlack
                            ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).container1,
                        borderRadius: BorderRadius.circular(0.0.w)
                    ),
                    padding: EdgeInsets.all(0.0.w),
                    child: Hero(
                      tag: "goal:$widget.index",
                      child: Material(
                        child: AutoSizeText(
                          widget.pathsModel.data.paths[0].path[0].attributes.length == 0 ?
                          "Dummy Attribute" :

                          widget.pathsModel.data.paths[0].path[0].attributes[0].toString(),
                          style: FlutterFlowTheme.of(context).labelExtraSmall.override(
                              useGoogleFonts: false,
                              fontWeight: FontWeight.w400,
                              color: FlutterFlowTheme.of(context).fixedBlack.withOpacity(.50)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.0.h,
            ),
              Expanded(child: PathListView(pathsModel: widget.pathsModel,
                
              )),

          ],
        )
      ),
    );
  }
}
