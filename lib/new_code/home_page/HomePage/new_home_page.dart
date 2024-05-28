import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/common_widgets/bountyWidget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/vouchCard.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/feeds_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/recommendations_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/paths_list_controller.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';
import 'package:vouch/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../common_widgets/myAppBar.dart';
import 'components/rounded_text_field.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  String _greeting = "";

  List<Contact> starredContacts = [];
  final feedsController = Get.put(FeedsController());
  final recommendationsController = Get.put(RecommendationsController());
  var vouchFeedsData;
  var bountyFeeedsData;
  var recommendationsData;

  @override
  void initState() {
    super.initState();
    checkUser();
    fetchRecommendations();
    fetchFeeds();
    getStarredContacts();
    _updateGreeting();
  }

  Future<void> _updateGreeting() async {
    DateTime now = DateTime.now();

    setState(() {
      if (now.hour >= 22 && now.hour < 4) {
        _greeting = "Good night";
      } else if (now.hour < 12) {
        _greeting = "Good morning";
      } else if (now.hour < 16) {
        _greeting = "Good afternoon";
      } else {
        _greeting = "Good evening";
      }
    });
  }


  Future<void> getStarredContacts() async {
    await Permission.contacts.request();
    List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true, withThumbnail: true);
    List<Contact> starred =
        contacts.where((contact) => contact.isStarred).toList();
    if (starred.length > 4) {
      starred = starred.sublist(0, 4);
    }
    if (!mounted) return;
    setState(() {
      starredContacts = starred;
    });
  }

  void _makePhoneCall(String phoneNumber) async {
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
        bountyFeeedsData = fetchedFeeds.bounties;
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
    DateTime timeBackPressed = DateTime.now();
    Future<bool> onWillPop() async {
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= const Duration(seconds: 2);
      timeBackPressed = DateTime.now();
      if (isExitWarning) {
        const message = "Press back again to Exit!";
        Get.snackbar(snackPosition: SnackPosition.BOTTOM, "Alert", message);
        return false;
      } else {
        Get.snackbar("Cancel", "");
        return true;
      }
    }

    print("Vouch Feeds Data : $vouchFeedsData");

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(),
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: 16.0.w, right: 16.0.w, bottom: 16.0.h, top: 8.0.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RoundedTextField(),
              SizedBox(width: 6.w),
              GestureDetector(
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      color: FlutterFlowTheme.of(context).ffButton),
                  child: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                onTap: () {
                  Get.to(() => const PermissionsScreen());
                },
              )
            ],
          ),
        ),
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
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
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
                          SizedBox(height: 12.0.h),
                          Row(
                            mainAxisAlignment: starredContacts.length < 4
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(starredContacts.length, (index) {
                              String phoneNumber = starredContacts[index]
                                      .phones
                                      .isNotEmpty
                                  ? starredContacts[index].phones.first.number
                                  : '';
                              return GestureDetector(
                                onTap: () {
                                  if (phoneNumber.isNotEmpty) {
                                    _makePhoneCall(phoneNumber);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "No phone number available for this contact")),
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
                                                  child: Image.asset(
                                                      Assets.assetsDefault))),
                                      SizedBox(height: 4.h),
                                      SizedBox(
                                        width: 60.w,
                                        child: AutoSizeText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          starredContacts[index].displayName,
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
                          SizedBox(height: 24.0.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              "Our Recommendations",
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                          SizedBox(
                            height: 4.0.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                "Based on your goals",
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                        useGoogleFonts: false,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText
                                            .withOpacity(0.6)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => EditGoalsScreen());
                                },
                                child: AutoSizeText(
                                  "Edit Goals",
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                          useGoogleFonts: false,
                                          decoration: TextDecoration.underline,
                                          color: FlutterFlowTheme.of(context)
                                              .primary),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8.0.h),
                          Container(
                              height: 144.h,
                              child: recommendationsData != null
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
                                          if (recommendationsData.isEmpty) {
                                            print(
                                                'Error: recommendationsData is null or index is out of bounds.');
                                            return const SizedBox();
                                          }
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
                                                        name:
                                                            recommendationsData[
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
                                                            "No Reason Found",
                                                      ));
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Hero(
                                                      tag: "image:$index",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child:
                                                            CustomCircleAvatar(
                                                          imageUrl:
                                                              recommendationsData[
                                                                      index]
                                                                  .photourl,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0.h),
                                                    Hero(
                                                      tag: "name:$index",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: AutoSizeText(
                                                          recommendationsData[
                                                                  index]
                                                              .name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fixedBlack,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.0.h),
                                                    Hero(
                                                      tag: "headline:$index",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: AutoSizeText(
                                                          recommendationsData[
                                                                  index]
                                                              .localizedheadline,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelExtraSmall
                                                              .override(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fixedBlack,
                                                                useGoogleFonts:
                                                                    false,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 16.0.h),
                                                    Hero(
                                                      tag: "goal:$index",
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: AutoSizeText(
                                                          recommendationsData[
                                                                  index]
                                                              .goal,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelExtraSmall
                                                              .override(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fixedBlack,
                                                                useGoogleFonts:
                                                                    false,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Center(child: Container())),
                          SizedBox(height: 16.0.h),
                          AutoSizeText(
                            "Vouch Feeds",
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          SizedBox(height: 12.0.h),
                          Obx(
                            () => Skeletonizer(
                              enabled: feedsController.isLoading.value,
                              child: feedsController.isLoading.value == false
                                  ? (vouchFeedsData.isNotEmpty)
                                      ? ListView.builder(
                                          itemCount: vouchFeedsData.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final vouchFeed =
                                                vouchFeedsData[index];
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0.h),
                                                child: feedsVouchWidget(
                                                    context, vouchFeed));
                                          },
                                        )
                                      : Container(
                                          height: 60.0.h,
                                          width: double.infinity,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    )),
                            ),
                          ),
                          SizedBox(height: 16.0.h),
                          AutoSizeText(
                            "Bounty Feeds",
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          SizedBox(height: 12.0.h),
                          bountyFeeedsData != null
                              ? ListView.builder(
                                  itemCount: bountyFeeedsData.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final bountyFeed = bountyFeeedsData[index];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 8.0.h),
                                        child: BountyWidget(
                                            bounty: bountyFeed,
                                            refreshFeeds: fetchFeeds));
                                  },
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
