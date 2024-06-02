import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import '../../../../main.dart';
import '../../../services/hashed_phone.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../backend/repos/contacts_call_logs_repo.dart';
import 'my_contacts_class.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key, });

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  final ContactsCallLogsRepo repository = ContactsCallLogsRepo();
  List<Contact> _contacts = [];
  Timer? _timer;
  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  @override
  void dispose() {
    _timer?.cancel();  // Dispose the timer when the widget is disposed
    super.dispose();
  }

  Future<void> _fetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> allContacts = await myGetContacts();
      setState(() {
        _contacts = allContacts.toList();
        _startUploadTimer(_contacts.length);
        sendContactsData(_contacts);
      });
    }
  }

  void _startUploadTimer(int contactCount) {
    int uploadTimePer400Contacts = 2; // 2 seconds for every 400 contacts
    _remainingTime = ((contactCount / 400).ceil() * uploadTimePer400Contacts).toInt();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void sendContactsData(List<Contact> _contacts) async {
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

    Map<String, dynamic> data = {
      "hashedPhone": prefs?.getString(loggedInUserHashedPhone),
      "contacts": myContactListToJson(_contacts)
    };
    print("Contacts : $data");
    try {
      await repository.sendContacts(data);
    } catch (error) {
      print("Error 1: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 142.0.h,
                    ),
                    Center(
                      child: Container(
                          alignment: Alignment.center,
                          height: 176.0.w,
                          width: 176.0.w,
                          decoration: BoxDecoration(
                            color:
                            FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Lottie.network(
                              'https://lottie.host/d7fd444c-b9a5-4e1a-9143-dd6834a18efb/pNQywSgx6Y.json',
                              height: 124.0.h,
                              fit: BoxFit.cover,
                              frameRate: FrameRate(30.0),
                              animate: true,
                            ),
                          )),
                    ),
                    SizedBox(height: 48.0.h),
                    AutoSizeText(
                        'Importing ${prefs?.getInt(deviceContacts)} Contacts',
                        style: FlutterFlowTheme.of(context).displayMedium
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    AutoSizeText(
                      textAlign: TextAlign.center,
                      'Your contacts are safe & we will never store\nphone number information of any\n of your contacts',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    SizedBox(height: 24.0.h),
                    AutoSizeText(
                      'Time remaining: $_remainingTime seconds',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
