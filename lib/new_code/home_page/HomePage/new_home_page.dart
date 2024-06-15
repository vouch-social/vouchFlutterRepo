import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '/auth/checkAuth.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/common_widgets/bountyWidget.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/common_widgets/vouchCard.dart';
import '/new_code/home_page/HomePage/controllers/feeds_controller.dart';
import '/new_code/home_page/HomePage/recommendations_controller.dart';
import '/new_code/home_page/HomePage/paths_list_controller.dart';
import '/new_code/home_page/bounty_screen/bounty_screen.dart';
import '/new_code/home_page/paths_screen/paths_screen.dart';
import '/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import '/new_code/onboarding/goals/goals_screen.dart';
import '/new_code/onboarding/linkdin/linkdin_screen.dart';
import '/new_code/onboarding/permissions/permissions_screen.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../common_widgets/myAppBar.dart';
import '../../common_widgets/recommendations_card_widget.dart';
import 'components/bottom_bar_widget.dart';
import 'components/rounded_text_field.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  String _greeting = "";
  bool refreshStatus = false;
  List<Contact> starredContacts = [];
  final feedsController = Get.put(FeedsController());
  final recommendationsController = Get.put(RecommendationsController());
  var vouchFeedsData = [];
  var bountyFeedsData = [];
  var recommendationsData = [];
  @override
  void initState() {
    super.initState();
    checkUser();
    _initializeData();
    _updateGreeting();
  }

  void _initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchRecommendations();
      fetchFeeds();
      getStarredContacts();
    });
  }

  Future<void> _updateGreeting() async {
    DateTime now = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        if (now.hour >= 22 || now.hour < 4) {
          _greeting = "Good night";
        } else if (now.hour >= 4 && now.hour < 12) {
          _greeting = "Good morning";
        } else if (now.hour >= 12 && now.hour < 17) {
          _greeting = "Good afternoon";
        } else {
          _greeting = "Good evening";
        }
      });
    });
  }

  var isLoading = false.obs;
  Future<void> getStarredContacts() async {
    isLoading(true);
    await Permission.contacts.request();
    List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true, withThumbnail: true);
    List<Contact> starred =
        contacts.where((contact) => contact.isStarred).toList();
    if (starred.length > 4) {
      starred = starred.sublist(0, 4);
    }
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        starredContacts = starred;
      });
    });
    isLoading(false);
  }

  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> fetchFeeds() async {
    var fetchedFeeds = await feedsController.getHomePageFeeds();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        vouchFeedsData = fetchedFeeds.vouches;
        bountyFeedsData = fetchedFeeds.bounties;
      });
    });
  }

  Future<void> fetchRecommendations() async {
    var fetchedRecommendations =
        await recommendationsController.getRecommendationsData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        recommendationsData = fetchedRecommendations.userData;
      });
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(180),
      random.nextInt(180),
      random.nextInt(180),
    );
  }

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

    return Scaffold(
      appBar: const CustomAppBar(),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: const BottomBarWidget(),
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          color: FlutterFlowTheme.of(context).primary,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          onRefresh: () async {
            print("Refreshing");
            await getStarredContacts();
            await _updateGreeting();
            await fetchRecommendations();
            await fetchFeeds();
            print("Refreshed");
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Hey ${prefs?.getString(userName)}",
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                  ),
                                  AutoSizeText(
                                    "$_greeting,",
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // checkRefresh(),
                          SizedBox(height: 12.0.h),
                          Skeletonizer(
                            enabled: isLoading.value,
                            child: Row(
                              mainAxisAlignment: starredContacts.length < 4
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.spaceBetween,
                              children: List.generate(starredContacts.length,
                                  (index) {
                                String phoneNumber = starredContacts[index]
                                        .phones
                                        .isNotEmpty
                                    ? starredContacts[index].phones.first.number
                                    : '';
                                String displayName =
                                    starredContacts[index].displayName ?? '';
                                List<String> nameParts = displayName.split(' ');
                                String firstNameInitial =
                                    nameParts.isNotEmpty &&
                                            nameParts.first.isNotEmpty
                                        ? nameParts.first[0].toUpperCase()
                                        : '';
                                String lastNameInitial = nameParts.length > 1 &&
                                        nameParts.last.isNotEmpty
                                    ? nameParts.last[0].toUpperCase()
                                    : '';
                                String initials =
                                    '$firstNameInitial$lastNameInitial';

                                return GestureDetector(
                                  onTap: () {
                                    if (phoneNumber.isNotEmpty) {
                                      makePhoneCall(phoneNumber);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "No phone number available for this contact"),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    margin: starredContacts.length < 4
                                        ? EdgeInsets.only(right: 40.0.w)
                                        : EdgeInsets.only(right: 0.0.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.w,
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            color:
                                                starredContacts[index].photo ==
                                                        null
                                                    ? getRandomColor()
                                                    : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30.0.w),
                                          ),
                                          child: starredContacts[index].photo !=
                                                  null
                                              ? ClipOval(
                                                  child: Image.memory(
                                                      starredContacts[index]
                                                          .photo!),
                                                )
                                              : ClipOval(
                                                  child: Center(
                                                    child: AutoSizeText(
                                                        initials,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineLarge
                                                            .override(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fixedWhite,
                                                                useGoogleFonts:
                                                                    false,
                                                                fontSize:
                                                                    28.0.sp)),
                                                  ),
                                                ),
                                        ),
                                        SizedBox(height: 4.h),
                                        SizedBox(
                                          width: 60.0.w,
                                          child: AutoSizeText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            displayName,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelExtraSmall,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: 24.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                "Recommendations",
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => EditGoalsScreen());
                                },
                                child: AutoSizeText(
                                  "Edit Goals",
                                  style: FlutterFlowTheme.of(context)
                                      .labelExtraSmall
                                      .override(
                                          useGoogleFonts: false,
                                          decoration: TextDecoration.underline,
                                          color: FlutterFlowTheme.of(context)
                                              .primary),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.0.w,
                          ),
                          AutoSizeText(
                            "Based on your goals",
                            style: FlutterFlowTheme.of(context)
                                .labelExtraSmall
                                .override(
                                    useGoogleFonts: false,
                                    fontStyle: FontStyle.italic,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText
                                        .withOpacity(0.6)),
                          ),
                          SizedBox(height: 8.0.h),
                          Container(
                            height: 152.0.h,
                            child: recommendationsData != null ||   recommendationsData.isNotEmpty
                                ? Skeletonizer(
                                    enabled: recommendationsController
                                        .isLoading.value,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: recommendationsData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          width: 200.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0.w),
                                            color:
                                                colors[index % colors.length],
                                          ),
                                          margin: EdgeInsets.only(
                                              right: 8.0.w, top: 8.w),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(() => PathsScreen(
                                                      name: recommendationsData[
                                                              index]
                                                          .name,
                                                      hashedPhone:
                                                          recommendationsData[
                                                                  index]
                                                              .hashedphone,
                                                      image:
                                                          recommendationsData[
                                                                  index]
                                                              .photourl,
                                                      index: index,
                                                      headline:
                                                          recommendationsData[
                                                                  index]
                                                              .localizedheadline,
                                                      goals:
                                                          recommendationsData[
                                                                  index]
                                                              .goal,
                                                      reason:
                                                          recommendationsData[
                                                                      index]
                                                                  .reason ??
                                                              "",
                                                    ));
                                              },
                                              child: RecommendationCardWidget(
                                                index: index,
                                                imageUrl:
                                                    recommendationsData[index]
                                                        .photourl,
                                                name: recommendationsData[index]
                                                    .name,
                                                headline:
                                                    recommendationsData[index]
                                                        .localizedheadline,
                                                goal: recommendationsData[index]
                                                    .goal,
                                                reason:
                                                    recommendationsData[index]
                                                            .reason ??
                                                        "",
                                                maxLine: 1,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.assetsNoGoalsFound,
                                        height: 120.0.h,
                                      ),
                                      SizedBox(
                                        width: 24.0.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 180.0.w,
                                            child: AutoSizeText(
                                              "No Recommendations available as your goals are empty!",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelExtraSmall,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.0.h,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Get.off(() => const GoalsScreen());
                                            },
                                            child: AutoSizeText(
                                              "Update Goals Now",
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                      useGoogleFonts: false,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      decoration: TextDecoration
                                                          .underline),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                          ),
                          SizedBox(height: 12.0.h),
                          Visibility(
                            visible: !prefs!.getBool(isLinkedinSync)!,
                            child: Container(
                              padding: EdgeInsets.all(12.0.w),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).textFieldBackground,
                                borderRadius: BorderRadius.circular(8.0.w),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText("Help us to know you better!",
                                  style: FlutterFlowTheme.of(context).titleSmall
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(() => const LinkedinScreen());
                                    },
                                    child: AutoSizeText("Sync Linkedin",
                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                        useGoogleFonts: false,
                                        color: FlutterFlowTheme.of(context).primary
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 8.0.h),
                          vouchFeedsData.isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(height: 12.0.h),
                                    AutoSizeText(
                                      "Vouch Feed",
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge,
                                    )
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 12.0.h),
                          Skeletonizer(
                              enabled: feedsController.isLoading.value,
                              child: (vouchFeedsData.isNotEmpty)
                                  ? ListView.builder(
                                      itemCount: vouchFeedsData.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final vouchFeed = vouchFeedsData[index];
                                        return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0.h),
                                            child: FeedsVouchCard(
                                              refreshFeeds: fetchFeeds,
                                              feedModelVouch: vouchFeed,
                                            ));
                                      },
                                    )
                                  : Container()),
                          SizedBox(height: 16.0.h),
                          (bountyFeedsData.isNotEmpty)
                              ? AutoSizeText(
                                  "Bounty Feed",
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                )
                              : Container(),
                          SizedBox(height: 12.0.h),
                          bountyFeedsData.isNotEmpty
                              ? ListView.builder(
                                  itemCount: bountyFeedsData.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final bountyFeed = bountyFeedsData[index];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 8.0.h),
                                        child: BountyWidget(
                                            bounty: bountyFeed,
                                            refreshFeeds: fetchFeeds));
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
