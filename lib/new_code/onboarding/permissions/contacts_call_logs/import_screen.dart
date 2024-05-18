import 'package:auto_size_text/auto_size_text.dart';
import 'package:call_log/call_log.dart';
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
  const ImportScreen({super.key, this.mobileWOCC, this.countryCode});
  final String? mobileWOCC;
  final String? countryCode;

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  final ContactsCallLogsRepo repository = ContactsCallLogsRepo();
  List<Contact> _contacts = [];
  List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    //_fetchCallLogs();
  }

  Future<void> _fetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> allContacts = await myGetContacts();
      setState(() {
        _contacts = allContacts.toList();
        sendContactsData(_contacts);
      });
    }
  }

  void sendContactsData(List<Contact> _contacts) async {


    List<Map<String, dynamic>> myContactListToJson(List<Contact> contacts) {
      return contacts.map((contact) => contact.toJson()).toList();
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

  Future<void> _fetchCallLogs() async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      List<CallLogEntry> logs = await getCallLogs();
      setState(() {
        _callLogs = logs;
        sendCallLogsData(_callLogs);
      });
    }
  }

  void sendCallLogsData(List<CallLogEntry> _callLogs) async {
    Map<String, dynamic> callLogEntryToJson(CallLogEntry callLog) {
      return {
        'name': callLog.name ?? "",
        'number': callLog.number ?? "",
        'formattedNumber': callLog.formattedNumber ?? "",
        'callType': callLog.callType?.name ?? "",
        'duration': callLog.duration ?? "",
        'timestamp': callLog.timestamp ?? "",
        'cachedNumberType': callLog.cachedNumberType ?? "",
        'cachedNumberLabel': callLog.cachedNumberLabel ?? "",
        'cachedMatchedNumber': callLog.cachedMatchedNumber ?? "",
        'simDisplayName': callLog.simDisplayName ?? "",
        'phoneAccountId': callLog.phoneAccountId ?? "",
      };
    }

    List<Map<String, dynamic>> myCallListToJson(List<CallLogEntry> callLogs) {
      return callLogs
          .map((callLog) => callLogEntryToJson(callLog))
          .take(10)
          .toList();
    }

    var data = {
      "hashedPhone": hashedPhone(
        widget.mobileWOCC,
        widget.countryCode,
      ),
      "callLogs": myCallListToJson(_callLogs)
    };
    try {
      await repository.sendCallLogs(data);
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
                      'Importing Contacts',
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
