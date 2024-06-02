import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/new_code/common_widgets/image_check.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../services/hashed_phone.dart';
import 'ignore_contacts_controller.dart';

// class IgnoreListScreen extends StatefulWidget {
//   final List<Map<String, String>> alreadyIgnored;
//
//   const IgnoreListScreen({super.key, required this.alreadyIgnored});
//
//   @override
//   State<IgnoreListScreen> createState() => _IgnoreListScreenState();
// }
//
// class _IgnoreListScreenState extends State<IgnoreListScreen> {
//   List<Contact> _contacts = [];
//   List<Contact> _filteredContacts = [];
//   List<Contact> _ignoreList = [];
//   List<Contact> _awesomeList = [];
//   List<Contact> _alreadyIgnoredList = [];
//   final TextEditingController _searchController = TextEditingController();
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts();
//     _searchController.addListener(_filterContacts);
//     _initializeIgnoreList();
//     _buildAwesomeList();
//   }
//
//   void _initializeIgnoreList() {
//     setState(() {
//       _alreadyIgnoredList = widget.alreadyIgnored.map((ignored) {
//         return Contact(
//           displayName: ignored['displayName']!,
//           phones: [Phone(ignored['originalPhone'] ?? '')],
//         );
//       }).toList();
//       _ignoreList = List.from(_alreadyIgnoredList);
//       print("Ignore list: $_ignoreList");
//     });
//   }
//
//   Future<void> _fetchContacts() async {
//     List<Contact> contacts = await myGetContacts();
//     setState(() {
//       _contacts = contacts;
//       _isLoading = false;
//     });
//   }
//
//   void _filterContacts() {
//     setState(() {
//       _filteredContacts = _contacts
//           .where((contact) =>
//       contact.displayName
//               .toLowerCase()
//               .contains(_searchController.text.toLowerCase()))
//           .toList();
//     });
//   }
//
//   // void _toggleIgnoreContact(Contact contact) {
//   //   setState(() {
//   //     if (_ignoreList.contains(contact)) {
//   //       _ignoreList.remove(contact);
//   //     } else {
//   //         if (!_awesomeList.contains(contact)) {
//   //           _awesomeList.add(contact);
//   //         }else{
//   //           _ignoreList.add(contact);
//   //           _awesomeList.remove(contact);
//   //         }
//   //     }
//   //     _buildAwesomeList();
//   //   });
//   // }
//
//
//
//   // void _buildAwesomeList() {
//   //   _awesomeList = [
//   //     ..._ignoreList,
//   //     ..._filteredContacts.where((contact) =>
//   //     !_contactExistsInList(contact, _ignoreList) &&
//   //         !_contactExistsInList(contact, _alreadyIgnoredList))
//   //   ];
//   // }
//
//
//   void _toggleIgnoreContact(Contact contact) {
//     setState(() {
//       if (_ignoreList.contains(contact)) {
//         _ignoreList.remove(contact);
//       } else {
//         _ignoreList.add(contact);
//       }
//       print("Ignore LIst 1 : $_ignoreList");
//       _buildAwesomeList();
//     });
//   }
//
//   void _buildAwesomeList() {
//     _awesomeList = [
//       ..._ignoreList,
//       ..._filteredContacts.where((contact) =>
//       !_ignoreList.contains(contact))
//     ];
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   List<Map<String, String>> extractHashedPhones(List<Contact> contacts) {
//     return contacts.expand((contact) {
//       return contact.phones.map((singlePhone) {
//         String hashedPhone = contactHashedPhone(singlePhone.number, "");
//         return {"hashedPhone": hashedPhone};
//       });
//     }).toList();
//   }
//
//   final controller = Get.put(IgnoreContactsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: Container(
//           color: FlutterFlowTheme.of(context).primaryBackground,
//           child: Padding(
//             padding: EdgeInsets.all(16.0.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 56.0.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(36.0),
//                     color: FlutterFlowTheme.of(context).textFieldBackground,
//                     border: Border.all(
//                       color: FlutterFlowTheme.of(context)
//                           .primaryText.withOpacity(0.3),
//                     ),
//                   ),
//                   child: TextField(
//                     autofocus: true,
//                     controller: _searchController,
//                     style: FlutterFlowTheme.of(context).titleSmall,
//                     cursorColor: FlutterFlowTheme.of(context).primaryText,
//                     decoration: InputDecoration(
//                       hintText: 'Search contacts',
//                       hintStyle: FlutterFlowTheme.of(context).titleSmall,
//                       enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide.none),
//                       focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide.none),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: FlutterFlowTheme.of(context).primaryText,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16.0.h,
//                 ),
//                 AutoSizeText(
//                   "${_ignoreList.length} Number selected",
//                   style: FlutterFlowTheme.of(context).labelExtraSmall,
//                 ),
//                 SizedBox(
//                   height: 12.0.h,
//                 ),
//                 Divider(
//                   color: FlutterFlowTheme.of(context)
//                       .primaryText
//                       .withOpacity(0.5),
//                 ),
//                 _isLoading
//                     ? Column(
//                   children: [
//                     SizedBox(
//                       height: 280.0.h,
//                     ),
//                     const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   ],
//                 )
//                     : Expanded(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: _awesomeList.length,
//                     itemBuilder: (context, index) {
//                       Contact contact = _awesomeList[index];
//                       bool isIgnored = _ignoreList.contains(contact);
//                       return Container(
//                         decoration: BoxDecoration(
//                           color: FlutterFlowTheme.of(context)
//                               .primaryBackground,
//                           border: Border(
//                             bottom: BorderSide(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground
//                                   .withOpacity(0.3),
//                             ),
//                           ),
//                         ),
//                         child: ListTile(
//                           leading: CustomCircleAvatar(
//                             imageUrl: 'fsagag',
//                             radius: 20.0.w,
//                           ),
//                           tileColor: FlutterFlowTheme.of(context)
//                               .textFieldBackground,
//                           title: AutoSizeText(
//                             contact.displayName ?? 'No name',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleSmall,
//                           ),
//                           subtitle: AutoSizeText(
//                             contact.phones.isNotEmpty
//                                 ? contact.phones.first.number
//                                 : 'No number',
//                             style: FlutterFlowTheme.of(context)
//                                 .labelExtraSmall
//                                 .override(
//                                 useGoogleFonts: false,
//                                 color: FlutterFlowTheme.of(context)
//                                     .primary
//                                     .withOpacity(0.8)),
//                           ),
//                           trailing: IconButton(
//                             icon: Icon(
//                               isIgnored
//                                   ? Icons.check_box
//                                   : Icons
//                                   .check_box_outline_blank_outlined,
//                               color: isIgnored
//                                   ? FlutterFlowTheme.of(context)
//                                   .ffButton
//                                   : FlutterFlowTheme.of(context)
//                                   .secondaryBackground
//                                   .withOpacity(0.2),
//                             ),
//                             onPressed: () =>
//                                 _toggleIgnoreContact(contact),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(
//             left: 16.0.w, right: 16.0.w, bottom: 16.0.w, top: 0.0.w),
//         child: FFButtonWidget(
//           text: 'Update List',
//           onPressed: () async {
//
//             List<Map<String, String>> alreadyIgnoredHashedPhoneNumbers =
//             extractHashedPhones(_alreadyIgnoredList);
//             List<Map<String, String>> hashedPhoneNumbers =
//             extractHashedPhones(_ignoreList);
//             if(alreadyIgnoredHashedPhoneNumbers.isNotEmpty && hashedPhoneNumbers.isNotEmpty){
//               print("ALready Ingored!: $alreadyIgnoredHashedPhoneNumbers");
//               await controller.removeIgnoredContacts(alreadyIgnoredHashedPhoneNumbers);
//               await controller.ignoreContacts(hashedPhoneNumbers);
//               print(" Ingored!: $hashedPhoneNumbers");
//
//               Get.off(() => const SettingsScreen());
//             }
//             else if(alreadyIgnoredHashedPhoneNumbers.isNotEmpty && hashedPhoneNumbers.isEmpty ) {
//               print("ALready Ingored!: $alreadyIgnoredHashedPhoneNumbers");
//
//               await controller.removeIgnoredContacts(alreadyIgnoredHashedPhoneNumbers);
//               Get.snackbar("Alert", "No contacts Ignored!");
//               Get.off(() => const SettingsScreen());
//             }
//             else if(alreadyIgnoredHashedPhoneNumbers.isEmpty && hashedPhoneNumbers.isNotEmpty ) {
//               print(" Ingored!: $hashedPhoneNumbers");
//
//               await controller.ignoreContacts(hashedPhoneNumbers);
//               Get.off(() => const SettingsScreen());
//             }
//             else{
//               Get.snackbar("Alert", "No contacts Ignored!");
//               Get.off(() => const SettingsScreen());            }
//           },
//           options: CTAButton(context),
//         ),
//       ),
//     );
//   }
// }



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

class IgnoreListScreen extends StatefulWidget {

  final List<Map<String, String>> alreadyIgnored;

  const IgnoreListScreen({super.key, required this.alreadyIgnored});

  @override
  State<IgnoreListScreen> createState() => _IgnoreListScreenState();
}

class _IgnoreListScreenState extends State<IgnoreListScreen> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  List<Contact> _ignoreList = [];
  List<Contact> _awesomeList = [];
  List<Contact> _alreadyIgnoredList = [];
  TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterContacts);
    _fetchContacts();
    _initializeIgnoreList();
  }
  void _initializeIgnoreList() {
    setState(() {
      _alreadyIgnoredList = widget.alreadyIgnored.map((ignored) {
        return Contact(
          displayName: ignored['displayName']!,
          phones: [Phone(ignored['originalPhone'] ?? '')],
        );
      }).toList();
      _ignoreList = List.from(_alreadyIgnoredList);
      print("Ignore list: $_ignoreList");
    });
  }

  Future<void> _fetchContacts() async {
    List<Contact> contacts = await myGetContacts();
    setState(() {
      _contacts = contacts;
      _filteredContacts = _contacts;
      _buildAwesomeList();
      _isLoading = false;
    });
  }

  void _filterContacts() {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) =>
      contact.displayName != null &&
          contact.displayName!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _buildAwesomeList();
    });
  }

  void _toggleIgnoreContact(Contact contact) {
    setState(() {
      if (_ignoreList.contains(contact)) {
        _ignoreList.remove(contact);
      } else {
        _ignoreList.add(contact);
      }
      print("Ignore List1 : $_ignoreList");
      _buildAwesomeList();
    });
  }

  void _buildAwesomeList() {
    _awesomeList = [
      ..._ignoreList,
      ..._filteredContacts.where((contact) => !_ignoreList.contains(contact))
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> extractHashedPhones(List<Contact> contacts) {
    return contacts.expand((contact) {
      return contact.phones.map((singlePhone) {
        String hashedPhone = contactHashedPhone(singlePhone.number, "");
        return {"hashedPhone": hashedPhone};
      });
    }).toList();

  }



  final controller = Get.put(IgnoreContactsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56.0.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0),
                    color: FlutterFlowTheme.of(context).textFieldBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context)
                          .primaryText.withOpacity(0.3),
                    ),
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: _searchController,
                    style: FlutterFlowTheme.of(context).titleSmall,
                    cursorColor:
                    FlutterFlowTheme.of(context).primaryText,
                    decoration: InputDecoration(
                      hintText: 'Search contacts',
                      hintStyle: FlutterFlowTheme.of(context).titleSmall,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0.h,
                ),
                AutoSizeText(" ${_ignoreList.length} Number selected",
                  style: FlutterFlowTheme.of(context).labelExtraSmall,
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Divider(
                  color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.5),
                ),
                _isLoading
                    ? Column(
                  children: [
                    SizedBox(height: 280.0.h,),
                    const Center(child: CircularProgressIndicator()),
                  ],
                )
                    : Expanded(
                  child: ListView.builder(
                    itemCount: _awesomeList.length,
                    itemBuilder: (context, index) {
                      Contact contact = _awesomeList[index];
                      bool isIgnored = _ignoreList.contains(contact);
                      return Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .primaryBackground,
                          border: Border(
                            bottom: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground
                                  .withOpacity(0.3),
                            ),),),
                        child: ListTile(
                          leading: CustomCircleAvatar(
                            imageUrl: 'fsagag',
                            radius: 20.0.w,
                          ),
                          tileColor: FlutterFlowTheme.of(context)
                              .textFieldBackground,
                          title: AutoSizeText(
                            contact.displayName ?? 'No name',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall,
                          ),
                          subtitle: AutoSizeText(
                            contact.phones.isNotEmpty
                                ? contact.phones.first.number
                                : 'No number',
                            style: FlutterFlowTheme.of(context)
                                .labelExtraSmall.override(
                                useGoogleFonts: false,
                                color: FlutterFlowTheme.of(context).primary.withOpacity(0.8)
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              isIgnored
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank_outlined,
                              color: isIgnored ? FlutterFlowTheme.of(context)
                                  .ffButton : FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.2),
                            ),
                            onPressed: () =>
                                _toggleIgnoreContact(contact),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 16.0.w, right: 16.0.w, bottom: 16.0.w, top: 0.0.w),
        child: FFButtonWidget(
          text: 'Update List',
          onPressed: () async{
            List<Map<String, String>> hashedPhoneNumbers =  extractHashedPhones(_ignoreList);
            if(hashedPhoneNumbers.isNotEmpty){
              print(hashedPhoneNumbers);
              await controller.ignoreContacts(hashedPhoneNumbers);
              Get.off(() => SettingsScreen());
            }else{
              Get.snackbar("Alert", "No contacts added!");
            }
          },
          options: CTAButton(context),
        ),
      ),
    );
  }
}

