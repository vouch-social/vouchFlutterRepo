import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/vector.dart';
import 'package:vouch/new_code/home_page/bounty_screen.dart';
import 'package:vouch/new_code/home_page/home_page_controller.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';
import 'package:vouch/new_code/home_page/search_screen/search_screen.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

import '../../generated/assets.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(390, 844),
        splitScreenMode: true,
        minTextAdapt: true);

    final colors = [
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
    ];

    final List<String> names = [
      'Nirant Ramakuru',
      "Abhiram Bali",
      'Shivani Narashimhan',
      'Kumar Sharma'
    ];
    final List<String> images = [
      'assets/image951.png',
      "assets/image951.png",
      'assets/image951.png',
      'assets/image951.png'
    ];
    final List<String> headLine = [
      'Strategy Builder | Leader',
      "Car Dealer | Used Car Seller",
      'Flutter Developer | Student',
      'Web Designer | @ Vouch'
    ];
    final List<String> goals = [
      'Want to find a driver for my car',
      "Find a maths tutor",
      'Find a DotNet Developer',
      'Want to buy a second hand car'
    ];

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Hey Nirant",
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      AutoSizeText(
                        "good morning,",
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => SettingsScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 500),
                        //curve: Curves.easeInOut,
                      );
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
                  )
                ],
              ),
              SizedBox(
                height: 12.0.h,
              ),

              // const ImageText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.w),
                          ),
                          child: Image.asset('assets/image951.png'),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: AutoSizeText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            'Chitranjan Ramakuru',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.w),
                          ),
                          child: Image.asset('assets/image951.png'),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: AutoSizeText(
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.w),
                          ),
                          child: Image.asset('assets/image951.png'),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: AutoSizeText(
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0.w),
                          ),
                          child: Image.asset('assets/image951.png'),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: AutoSizeText(
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).labelExtraSmall,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24.0.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Our Recommendations",
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              SizedBox(
                height: 144.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                         controller.getPathsList();

                      },
                      child: Container(
                          height: 120.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0.w),
                              color: colors[index]),
                          margin: EdgeInsets.only(right: 8.0.w, top: 8.w),
                          child: Padding(
                            padding: EdgeInsets.all(12.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag:"image:$index",
                                  child: Material(
                                    color: Colors.transparent,
                                    child:
                                    Container(
                                      width: 36.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0.w),
                                        color: Colors.grey,
                                      ),
                                      child: Image.asset(images[index]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0.h,
                                ),
                                Hero(
                                  tag: "name:$index",
                                  child: Material(
                                    color: Colors.transparent,
                                    child: AutoSizeText(
                                      names[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            color: FlutterFlowTheme.of(context)
                                                .fixedBlack,
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
                                    child: AutoSizeText(headLine[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .labelExtraSmall
                                            .override(
                                                color: FlutterFlowTheme.of(context)
                                                    .fixedBlack,
                                                useGoogleFonts: false,
                                                fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0.h,
                                ),
                                Hero(
                                  tag: "goal:$index",
                                  child: Material(
                                    color: Colors.transparent,
                                    child: AutoSizeText(
                                      goals[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .labelExtraSmall
                                            .override(
                                                color: FlutterFlowTheme.of(context)
                                                    .fixedBlack,
                                                useGoogleFonts: false,
                                                fontWeight: FontWeight.w400)),
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Your Reminders",
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: AutoSizeText("View All",
                        style: FlutterFlowTheme.of(context).labelExtraSmall),
                  )
                ],
              ),
              SizedBox(
                height: 16.0.h,
              ),
              const RemindersListView(),

              const Spacer(),
              Row(
                children: [
                  const RoundedTextField(),
                  SizedBox(
                    width: 6.w,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          color: FlutterFlowTheme.of(context).primary),
                      child: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).white,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => BountyScreen());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchScreen());
      },
      child: Hero(
        tag: "Search",
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width - 88.w,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0.w),
              color: FlutterFlowTheme.of(context).textFieldBackground,
              //border: Border.all(color: FlutterFlowTheme.of(context).textFieldBackground),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText('Type, talk, ask?',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleSmall),
            ),
          ),
        ),
      ),
    );
  }
}

class RemindersListView extends StatelessWidget {
  //final List<String> items = List.generate(3, (index) => 'Item $index');

  const RemindersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> reminderColors = [
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container3,
      FlutterFlowTheme.of(context).container2,
      FlutterFlowTheme.of(context).container1,
      FlutterFlowTheme.of(context).container2,
    ];

    return Container(
      height: 192.h,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: FlutterFlowTheme.of(context).primaryBackground,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0.w),
                      ),
                      child: Image.asset('assets/image951.png'),
                    ),
                    SizedBox(width: 16.0.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Bhaagyasree Kuruvilla",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Bricolage Grotesque',
                          ),
                        ),
                        SizedBox(height: 4.h),
                        AutoSizeText(
                          "#CEO #businessman",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).fixedWhite,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Bricolage Grotesque',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.0.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.00.w),
                                color: reminderColors[index],
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  "Birthday",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Bricolage Grotesque',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0.h),
                            AutoSizeText(
                              "Tomorrow",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).fixedBlack,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Bricolage Grotesque',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8.0.w),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: FlutterFlowTheme.of(context).border2,
            thickness: 1.sp,
          );
        },
        itemCount: 3,
      ),
    );
  }
}
