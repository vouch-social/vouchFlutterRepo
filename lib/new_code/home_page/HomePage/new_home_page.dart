import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vouch/auth/checkAuth.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/my_hunts_model.dart';
import 'package:vouch/new_code/common_widgets/bountyWidget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/my_hunts_card.dart';
import 'package:vouch/new_code/common_widgets/vouchCard.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/feeds_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/recommendations_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/paths_list_controller.dart';
import 'package:vouch/new_code/home_page/bounty_screen/bounty_screen.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';
import 'package:vouch/new_code/home_page/settings/edit_goals/edit_goals_screen.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import 'package:vouch/new_code/onboarding/linkdin/linkdin_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../backend/models/connection_suggestions_model.dart';
import '../../backend/repos/contacts_call_logs_repo.dart';
import '../../common_widgets/myAppBar.dart';
import '../../common_widgets/recommendations_card_widget.dart';
import '../../onboarding/permissions/contacts_call_logs/my_contacts_class.dart';
import '../../services/hashed_phone.dart';
import '../history_screen/my_hunts_controller.dart';
import 'components/bottom_bar_widget.dart';
import 'components/rounded_text_field.dart';
import 'controllers/connections_suggestions_controller.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  String _greeting = "";
  bool refreshStatus = false;
  final feedsController = Get.put(FeedsController());
  final recommendationsController = Get.put(RecommendationsController());
  final connectionsSuggestionsController = Get.put(ConnectionsSuggestionsController());
  final huntsController = Get.put(HuntsController());
  var vouchFeedsData = [];
  var bountyFeedsData = [];
  var recommendationsData = [];
  var suggestionsData = [];
  var huntsData = [];
  final ContactsCallLogsRepo repository = ContactsCallLogsRepo();
  List<Contact> _contacts = [];
  Future<void> _fetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> allContacts = await myGetContacts();
      setState(() {
        _contacts = allContacts.toList();
      });
      sendContactsData(_contacts);
    }
  }



  Future<void> sendContactsData(List<Contact> contacts) async {
    List<Map<String, dynamic>> myContactListToJson(List<Contact> contacts) {
      return contacts.map((contact) {
        var hashedPhones = contact.phones.map((singlePhone) {
          var hashedPhoneinList = contactHashedPhone(singlePhone.number, "");
          Map<String, dynamic> returnSinglePhone = {
            "hashedPhone": hashedPhoneinList
          };
          return returnSinglePhone;
        }).toList();
        var tempContact = {
          "displayName": contact.displayName,
          "phones": hashedPhones
        };
        return tempContact;
      }).toList();
    }

    final deviceContactsCount = prefs?.getInt(deviceContacts);
    final contactsAddedCount = prefs?.getInt(contactsAdded) ?? 0;

    if (deviceContactsCount != null  && deviceContactsCount > contactsAddedCount) {
      Map<String, dynamic> data = {
        "hashedPhone": prefs?.getString(loggedInUserHashedPhone),
        "contacts": myContactListToJson(contacts)
      };
      print("Contacts : $data");
      try {
         repository.autoSendContacts(data);
      } catch (error) {
        print("Error autoSend Contacts Home Page: $error");
      }
    } else {
      print("No new Contacts found");
    }
  }

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
      fetchSuggestions();
      fetchHunts();
      _fetchContacts();

    });
  }

  void fetchAllFeeds(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchFeeds();
      fetchHunts();
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


  Future<void> fetchHunts() async {
    var fetchedHunts = await huntsController.getHuntsHistory();

    List<MyHunt> claimedHunts = fetchedHunts.myHunts.where((hunt) => hunt.hunterStatus == "accept").toList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        huntsData = claimedHunts;
      });
    });
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

  Future<void> fetchSuggestions() async {
    var fetchedSuggestions = await connectionsSuggestionsController.getRecommendationsData();
    List<RecommendationDatum> suggestions = fetchedSuggestions.recommendationData
        .where((recommendationData) => recommendationData.name != null && recommendationData.name.isNotEmpty)
        .toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        suggestionsData = suggestions;
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

    return Scaffold(
      appBar: const CustomAppBar(
      ),
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
             _updateGreeting();
             fetchRecommendations();
             fetchFeeds();
             fetchSuggestions();
             fetchHunts();
            _fetchContacts();
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
                      Visibility(
                        visible: suggestionsData.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "Future Friends",
                              style:
                              FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ]
                        ),
                      ),
                          SizedBox(height: 12.0.h),
                          Skeletonizer(
                            enabled: connectionsSuggestionsController.isLoading.value,
                            child: Row(
                              mainAxisAlignment: suggestionsData.length < 4
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.spaceBetween,
                              children: List.generate(suggestionsData.length > 4 ? 4 : suggestionsData.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => PathsScreen(
                                      hashedPhone: suggestionsData[index].hashedphone,
                                      name: suggestionsData[index].name,
                                      headline: suggestionsData[index].localizedheadline,
                                      image: suggestionsData[index].photourl,
                                      reason: "High degree of mutual connections",
                                      goals: "Connect to new People",
                                      index: index,
                                    ));
                                  },
                                  child: Container(
                                    margin: suggestionsData.length < 4
                                        ? EdgeInsets.only(right: 40.0.w)
                                        : EdgeInsets.only(right: 0.0.w),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(1.0.w),
                                          decoration:BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                            borderRadius: BorderRadius.circular(30.0.w)
                                          ),
                                          child: CustomCircleAvatar(
                                            radius: 30.0.w,
                                            imageUrl: suggestionsData[index].photourl,
                                          ),
                                        ),
                                        SizedBox(height: 4.0.h),
                                        SizedBox(
                                          width: 60.0.w,
                                          child: AutoSizeText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            suggestionsData[index].name ?? "",
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelExtraSmall,
                                          ),
                                        ),
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
                                  Get.to(() => const EditGoalsScreen());
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
                            child:  recommendationsData.isNotEmpty
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
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                            width: 120.0.w,
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
                                    ),
                                    SizedBox(height: 12.0.h),
                                  ],
                                )
                              : Container(),

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
                                              refreshFeeds: fetchAllFeeds,
                                              feedModelVouch: vouchFeed,
                                            ));
                                      },
                                    )
                                  : Container()),
                          (bountyFeedsData.isNotEmpty || huntsData.isNotEmpty)
                              ? SizedBox(height: 16.0.h) : SizedBox(height: 0.0.h),
                          (bountyFeedsData.isNotEmpty || huntsData.isNotEmpty)
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
                                            refreshFeeds: fetchAllFeeds));
                                  },
                                )
                              : Container(),

                          Skeletonizer(
                              enabled: huntsController.isLoading.value,
                              child: (huntsData.isNotEmpty)
                                  ? ListView.builder(
                                itemCount: huntsData.length,
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final huntsFeed = huntsData[index];
                                  return Padding(
                                      padding:
                                      EdgeInsets.only(bottom: 8.0.h),
                                      child: MyHuntsCard(
                                        refreshCallBack: fetchAllFeeds,
                                        hunts: huntsFeed,
                                      ));
                                },
                              )
                                  : Container()),
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
