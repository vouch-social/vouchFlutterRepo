import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '/new_code/common_widgets/image_check.dart';
import '/new_code/common_widgets/myAppBar.dart';
import '/new_code/home_page/settings/ignore_contacts/ignore_contacts_screen.dart';
import '/new_code/home_page/settings/settings_screen.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../services/hashed_phone.dart';
import 'ignore_contacts_controller.dart';

class IgnoreListScreen extends StatefulWidget {

  final List<Map<String, String>> alreadyIgnored;
  final List<Map<String, String>> devicePhones;

  const IgnoreListScreen({super.key, required this.alreadyIgnored, required this.devicePhones});

  @override
  State<IgnoreListScreen> createState() => _IgnoreListScreenState();
}

class _IgnoreListScreenState extends State<IgnoreListScreen> {
  List<Map<String, String>> _contacts = [];
  List<Map<String, String>> _filteredContacts = [];
   List<Map<String, String>> _ignoredList = [];
  List<Map<String, String>> _awesomeList = [];
  List<Map<String, String>> _alreadyIgnoredList = [];
  final TextEditingController _searchController = TextEditingController();
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
      _alreadyIgnoredList.addAll(widget.alreadyIgnored);
      _ignoredList.addAll(widget.alreadyIgnored);
      _isLoading = false;
    });
  }

  Future<void> _fetchContacts() async {
    setState(() {
      _contacts = widget.devicePhones;
      _isLoading = false;
    });
  }

  void _filterContacts() {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) =>
      contact["displayName"] != null &&
          contact["displayName"]!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _buildAwesomeList();
    });
  }

  void _toggleIgnoreContact(dynamic contact) {
    setState(() {
      if (_ignoredList.contains(contact)) {
        _ignoredList.remove(contact);
      } else {
        _ignoredList.add(contact);
      }
      print("Ignore List1 : $_ignoredList");
      _buildAwesomeList();
    });
  }

  void _buildAwesomeList() {
    _awesomeList = [
      ..._ignoredList,
      ..._filteredContacts.where((contact) => !_ignoredList.contains(contact))
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> extractedHashedPhones(dynamic contacts){
    List<Map<String, String>> hashedPhones = [];
    for(var ignoreListItem in contacts){
      hashedPhones.add({"hashedPhone": ignoreListItem["hashedPhone"]});
    }
    print("HashedPhonesIgnored : $hashedPhones");
    return hashedPhones;
  }

  final controller = Get.put(IgnoreContactsController());
  @override
  Widget build(BuildContext context) {
    print("already Ignore: $_alreadyIgnoredList");
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
                    borderRadius: BorderRadius.circular(36.0.w),
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
                AutoSizeText(" ${_ignoredList.length} Number selected",
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
                      dynamic contact = _awesomeList[index];
                      bool isIgnored = _ignoredList.contains(contact);
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
                            contact['displayName'] ?? 'No name',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall,
                          ),
                          subtitle: AutoSizeText(
                            contact['originalPhone'],
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
            List<Map<String, String>> hashedPhoneNumbers =  extractedHashedPhones(_ignoredList);
            List<Map<String, String>> alreadyIgnoredNumbers =  extractedHashedPhones(_alreadyIgnoredList);
            if(alreadyIgnoredNumbers.isNotEmpty && hashedPhoneNumbers.isNotEmpty){
              print(alreadyIgnoredNumbers);
              await controller.removeIgnoredContacts(alreadyIgnoredNumbers);
              await controller.ignoreContacts(hashedPhoneNumbers);
              Get.off(() => const SettingsScreen());
            }else
            if(hashedPhoneNumbers.isNotEmpty && alreadyIgnoredNumbers.isEmpty){
              print(hashedPhoneNumbers);
              await controller.ignoreContacts(hashedPhoneNumbers);
              Get.off(() => const SettingsScreen());
            }
            else if(hashedPhoneNumbers.isEmpty && alreadyIgnoredNumbers.isNotEmpty){
              await controller.removeIgnoredContacts(alreadyIgnoredNumbers);
              Get.off(() => const SettingsScreen());
            }
            else{
              Get.off(() => const SettingsScreen());
            }

          },
          options: CTAButton(context),
        ),
      ),
    );
  }
}

