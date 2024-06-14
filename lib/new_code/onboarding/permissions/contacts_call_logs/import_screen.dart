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
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  final ContactsCallLogsRepo repository = ContactsCallLogsRepo();
  List<Contact> _contacts = [];
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    setState(() {
      _progress = 0.0;
    });

    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> allContacts = await myGetContacts();
      setState(() {
        _contacts = allContacts.toList();
      });

      sendContactsData(_contacts);
      for (int i = 0; i < _contacts.length; i++) {
        await processContact(_contacts[i]);
        if(!mounted){
          return;
        }
        setState(() {
          _progress = (i + 1) / _contacts.length;
        });
      }

    }

  }

  Future<void> processContact(Contact contact) async {
    await Future.delayed(const Duration(milliseconds: 5));
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

    Map<String, dynamic> data = {
      "hashedPhone": prefs?.getString(loggedInUserHashedPhone),
      "contacts": myContactListToJson(contacts)
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Column(
                children: [
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
                                color: FlutterFlowTheme.of(context).primaryBackground,
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
                              ),
                            ),
                          ),
                          SizedBox(height: 48.0.h),
                          AutoSizeText(
                            'Importing Contacts',
                            style: FlutterFlowTheme.of(context).displayMedium,
                          ),
                          SizedBox(
                            height: 8.0.h,
                          ),
                          AutoSizeText(
                            textAlign: TextAlign.center,
                            'Your contacts are safe & we will never store\nphone number information of any\n of your contacts',
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          SizedBox(height: 16.0.h),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 240.0.w,
                          height: 12.0.h,
                          child: LinearProgressIndicator(
                            value: _progress,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).pastelBlue,
                            ),
                            borderRadius: BorderRadius.circular(12.0.w),
                            backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                          ),
                        ),
                        SizedBox(width: 8.0.w),
                        AutoSizeText(
                          '${(_progress * 100).toStringAsFixed(1)}%',
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
