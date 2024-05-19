import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vouch/backend/firebase/firebase_config.dart';
// import 'package:vouch/bounty/raise_bounty/raise_bounty_widget.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/common_widgets/bountyWidget.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/vouchCard.dart';
import 'package:vouch/new_code/home_page/HomePage/controllers/feeds_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/recommendations_controller.dart';
import 'package:vouch/new_code/home_page/bounty_screen/bounty_controller.dart';
import 'package:vouch/new_code/home_page/HomePage/paths_list_controller.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';
import 'package:vouch/new_code/home_page/search_screen/search_screen.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';

import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../generated/assets.dart';
import '../../../main.dart';
import '../../common_widgets/myAppBar.dart';
import '../../common_widgets/my_bounty_widget.dart';
import '../bounty_screen/bounty_screen.dart';

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
    fetchRecommendations();
    fetchFeeds();
    getStarredContacts();
    _updateGreeting();
  }

  void _updateGreeting() async {
    // Get current time
    DateTime now = DateTime.now();
    // Format time
    String formattedTime = DateFormat.Hm().format(now);

    setState(() {
      if (formattedTime.contains("12:") && formattedTime.contains("PM")) {
        _greeting = "Good night";
      } else if (now.hour < 12) {
        _greeting = "Good morning";
      } else if (now.hour < 17) {
        _greeting = "Good afternoon";
      } else {
        _greeting = "Good evening";
      }
    });
  }

  Future<String?> _getCurrentCountry() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      return placemarks.first.country;
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }


  Future<void> getStarredContacts() async {
    // Request contact permission
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true, withThumbnail: true);

      // Filter contacts to get only starred ones
      List<Contact> starred =
          contacts.where((contact) => contact.isStarred).toList();

      // Pick only 4 starred contacts
      if (starred.length > 4) {
        starred = starred.sublist(0, 4);
      }
      if (!mounted) return;
      setState(() {
        starredContacts = starred;
      });
    } else {
      // Handle the scenario when permission is not granted
      // Show a message or request permission again
      print("Permission to access contacts was denied");
    }
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

    final List<String> names = [
      'Nirant Ramakuru',
      "Abhiram Bali",
      'Shivani Narashimhan',
      'Kumar Sharma',
      'kumar Vishwash'
    ];
    final List<String> images = [
      'assets/image951.png',
      "assets/image951.png",
      'assets/image951.png',
      'assets/image951.png',
      'assets/image951.png'
    ];
    final List<String> headLine = [
      'Strategy Builder | Leader',
      "Car Dealer | Used Car Seller",
      'Flutter Developer | Student',
      'Web Designer | @ Vouch',
      'Web Designer | @ Vouch'
    ];
    final List<String> goals = [
      'Want to find a driver for my car',
      "Find a maths tutor",
      'Find a DotNet Developer',
      'Want to buy a second hand car',
      'Want to buy a second hand car'
    ];
    return Scaffold(
      appBar: CustomAppBar(),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 16.0.w, right: 16.0.w, bottom: 16.0.h, top: 0),
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
                Get.to(() => BountyScreen());
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: FlutterFlowTheme.of(context).primary,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          onRefresh: () async {
            await fetchFeeds();
            await fetchRecommendations();
            await getStarredContacts();
          },
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          AutoSizeText(
                            "$_greeting,",
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h),
                  Row(
                    mainAxisAlignment:
                    starredContacts.length < 4 ?
                    MainAxisAlignment.start :
                    MainAxisAlignment.spaceBetween,
                    children: List.generate(starredContacts.length, (index) {
                      String phoneNumber =
                          starredContacts[index].phones.isNotEmpty
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0.w),
                                  ),
                                  child: starredContacts[index].photo != null
                                      ? ClipOval(
                                          child: Image.memory(
                                              starredContacts[index].photo!),
                                        )
                                      : Image.asset(Assets.assetsImage951)),
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
                  SizedBox(height: 8.0.h),
                  Container(
                      height: 144.h,
                      child: recommendationsData != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: recommendationsData.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (recommendationsData.isEmpty) {
                                  print(
                                      'Error: recommendationsData is null or index is out of bounds.');
                                  return const SizedBox();
                                }
                                return Container(
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0.w),
                                    color: colors[index % colors.length],
                                  ),
                                  margin:
                                      EdgeInsets.only(right: 8.0.w, top: 8.w),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => PathsScreen(
                                              name: recommendationsData[index]
                                                  .name,
                                              hashedPhone:
                                                  recommendationsData[index]
                                                      .hashedphone,
                                              image: recommendationsData[index]
                                                  .photourl,
                                              index: index,
                                              headline:
                                                  recommendationsData[index]
                                                      .localizedheadline,
                                              goals: recommendationsData[index]
                                                  .goal,
                                            ));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: "image:$index",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: CustomCircleAvatar(
                                                imageUrl:
                                                    recommendationsData[index]
                                                        .photourl,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8.0.h),
                                          Hero(
                                            tag: "name:$index",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: AutoSizeText(
                                                recommendationsData[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              child: AutoSizeText(
                                                recommendationsData[index]
                                                    .localizedheadline,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelExtraSmall
                                                        .override(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fixedBlack,
                                                          useGoogleFonts: false,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16.0.h),
                                          Hero(
                                            tag: "goal:$index",
                                            child: Material(
                                              color: Colors.transparent,
                                              child: AutoSizeText(
                                                recommendationsData[index].goal,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelExtraSmall
                                                        .override(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fixedBlack,
                                                          useGoogleFonts: false,
                                                          fontWeight:
                                                              FontWeight.w300,
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
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            )),
                  SizedBox(height: 16.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Vouch Feeds",
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h),
                  vouchFeedsData != null
                      ? ListView.builder(
                          itemCount: vouchFeedsData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final vouchFeed = vouchFeedsData[index];
                            return Padding(
                                padding: EdgeInsets.only(bottom: 8.0.h),
                                child: feedsVouchWidget(context, vouchFeed));
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
                  SizedBox(height: 16.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Bounty Feeds",
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ],
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
                                child: bountyWidget(context, bountyFeed));
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
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

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
                      AutoSizeText("Find Camera repairman",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context).bodyLarge),
                      SizedBox(height: 4.h),
                      AutoSizeText(
                        "Shantanu accepted vouch request",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
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
                      Icon(
                        Icons.access_time,
                        size: 16.0.h,
                        color: FlutterFlowTheme.of(context)
                            .primaryText
                            .withOpacity(0.3),
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      AutoSizeText(
                        '10:10 AM',
                        style: FlutterFlowTheme.of(context)
                            .labelExtraSmall
                            .override(
                              useGoogleFonts: false,
                              color: FlutterFlowTheme.of(context)
                                  .primaryText
                                  .withOpacity(0.3),
                            ),
                      )
                    ],
                  )
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
      itemCount: 2,
    );
  }
}
