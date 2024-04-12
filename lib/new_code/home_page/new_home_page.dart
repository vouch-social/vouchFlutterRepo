import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/vector.dart';
import 'package:vouch/new_code/home_page/search_screen.dart';

import '../../generated/assets.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
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

    return Scaffold(
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
                      Text(
                        "Hey Nirant",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Bricolage Grotesque',
                            color: FlutterFlowTheme.of(context).primaryText),
                      ),
                      Text(
                        "good morning,",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                            fontFamily: 'Bricolage Grotesque',
                            color: FlutterFlowTheme.of(context).primaryText),
                      ),
                    ],
                  ),
                  Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0.w),
                          color: FlutterFlowTheme.of(context).accent5),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: vector(Assets.assetsUserIcon,
                            height: 20.h, width: 20.w),
                      ))
                ],
              ),
              SizedBox(
                height: 12.sp,
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
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textScaler: MediaQuery.textScalerOf(context),
                            'Chitranjan Ramakuru',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Bricolage Grotesque',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
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
                          child: Text(
                            textScaler: MediaQuery.textScalerOf(context),
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Bricolage Grotesque',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
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
                          child: Text(
                            textScaler: MediaQuery.textScalerOf(context),
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Bricolage Grotesque',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
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
                          child: Text(
                            textScaler: MediaQuery.textScalerOf(context),
                            'Chitranjan Ramakuru',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Bricolage Grotesque',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22.sp,
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).primaryText),
                    ),
                    Text(
                      "recommendations",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).primaryText),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 110.h,
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
                              Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0.w),
                                  color: Colors.grey,
                                ),
                                child: Image.asset('assets/image951.png'),
                              ),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              Text(
                                "Nirant Ramakuru",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText),
                              ),
                              SizedBox(height: 4.0.h),
                              Text(
                                'Strategy Leader | Entrepreneur',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText)),
                      Text("reminders",
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText)),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Bricolage Grotesque',
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
                          )

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
                          color: FlutterFlowTheme.of(context).green1),
                      child: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).white,
                      ),
                    ),
                    onTap: () {},
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
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width - 88.w,
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.w),
          color: Colors.white,
          border: Border.all(color: FlutterFlowTheme.of(context).border1),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Type, talk, ask?',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bricolage Grotesque',
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
                        Text(
                          "Bhaagyasree Kuruvilla",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Bricolage Grotesque',
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "#CEO #businessman",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).tertiary2,
                            fontSize: 12.sp,
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
                                child: Text(
                                  "Birthday",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Bricolage Grotesque',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0.h),
                            Text(
                              "Tomorrow",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).tertiary1,
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
                            color: FlutterFlowTheme.of(context).tertiary1,
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


