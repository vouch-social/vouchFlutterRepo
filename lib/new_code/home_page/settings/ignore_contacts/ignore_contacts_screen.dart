import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/flutter_flow/flutter_flow_widgets.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/settings/ignore_contacts/ignore_contacts_controller.dart';

import '../../../common_widgets/image_check.dart';
import '../../../services/hashed_phone.dart';
import 'ignore_list_screen.dart';

Future<List<Contact>> myGetContacts() async {
  Iterable<Contact> entries = await FlutterContacts.getContacts(
    withProperties: true,
    withThumbnail: false,
    withPhoto: false,
    withGroups: false,
    withAccounts: false,
  );
  print('Total number of contacts on the phone: ${entries.length}');

  List<Contact> contactsWithPhones =
  entries.where((contact) => contact.phones.isNotEmpty).map((contact) {
    contact.displayName = contact.displayName ?? " ";
    contact.thumbnail = null;
    contact.emails = [];
    contact.addresses = [];
    contact.events = [];
    contact.notes = [];
    contact.organizations = [];
    return contact;
  }).toList();

  int eliminatedCount = entries.length - contactsWithPhones.length;

  print('Number of contacts eliminated: $eliminatedCount');

  return contactsWithPhones;
}

class IgnoreContactsScreen extends StatefulWidget {
  const IgnoreContactsScreen({super.key});

  @override
  State<IgnoreContactsScreen> createState() => _IgnoreContactsScreenState();
}

class _IgnoreContactsScreenState extends State<IgnoreContactsScreen> {
  final controller = Get.put(IgnoreContactsController());
  List<Contact> _contacts = [];
  var contactsList;
  List<Map<String, String>> matchedContacts = [];

  Future<void> _fetchContacts() async {
    List<Contact> contacts = await myGetContacts();
    setState(() {
      _contacts = contacts;
      compareHashedPhones();
    });

  }

  void _initializeData(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllContacts();
      _fetchContacts();
    });
  }

  Future<void> fetchAllContacts() async {
    var fetchedRecommendations = await controller.getAllContacts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        contactsList = fetchedRecommendations.contactsList
            .where((contact) => contact.status != 'accept')
            .toList();
      });
      compareHashedPhones();
    });
  }

  List<Map<String, String>> extractHashedPhones(List<Contact> contacts) {
    return contacts.expand((contact) {
      return contact.phones.map((singlePhone) {
        String hashedPhone = contactHashedPhone(singlePhone.number, "");
        return {"hashedPhone": hashedPhone, "originalPhone": singlePhone.number, "displayName": contact.displayName!};
      }).toList();
    }).toList();
  }

  List<Map<String, String>> deviceHashedPhones = [];

  void compareHashedPhones() {
    deviceHashedPhones = extractHashedPhones(_contacts);
    if (contactsList == null || _contacts.isEmpty) return;
    print("device hashedPhones $deviceHashedPhones");
    List<dynamic> serverHashedPhones = contactsList.map((contact) => contact.contacthashedphone.toString()).toList();

    List<Map<String, String>> matchedPhones = [];

    for (var deviceContact in deviceHashedPhones) {
      if (serverHashedPhones.contains(deviceContact["hashedPhone"])) {
        matchedPhones.add(deviceContact);
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        matchedContacts = matchedPhones;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        title: "Ignore List",
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: FFButtonWidget(
          text: 'Edit Ignore List',
          onPressed: () {
            print("Length :${deviceHashedPhones.length}");
            print("LengthMatched :${matchedContacts.length}");
            Get.to(() => IgnoreListScreen(alreadyIgnored: matchedContacts,devicePhones: deviceHashedPhones));
          },
          options: CTAButton(context),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await fetchAllContacts();
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  children: [
                    contactsList != null
                        ? (contactsList.isNotEmpty)
                        ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: matchedContacts.length,
                        itemBuilder: (context, index) {
                          var contact = matchedContacts[index];
                          return Obx(
                                () => Skeletonizer(
                              enabled: controller.isLoading.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                child: ListTile(
                                  leading: CustomCircleAvatar(
                                    imageUrl: 'fsagag',
                                    radius: 20.0.w,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .textFieldBackground,
                                  title: AutoSizeText(
                                    contact["displayName"]!,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall,
                                  ),
                                  subtitle: AutoSizeText(
                                    contact["originalPhone"]!,
                                    style: FlutterFlowTheme.of(context)
                                        .labelExtraSmall
                                        .override(
                                      useGoogleFonts: false,
                                      color: FlutterFlowTheme.of(
                                          context)
                                          .primary
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                        : Column(
                      children: [
                        SizedBox(
                          height: 240.0.h,
                        ),
                        Center(
                          child: AutoSizeText(
                            "No Contacts Ignored!",
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall,
                          ),
                        ),
                      ],
                    )
                        : Column(
                      children: [
                        SizedBox(
                          height: 240.0.h,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
