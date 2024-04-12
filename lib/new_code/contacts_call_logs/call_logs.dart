import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vouch/custom_code/actions/hashed_phone.dart';
import 'package:vouch/main.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import '../backend/repos/contacts_call_logs_repo.dart';

class CallLogs extends StatefulWidget {
  const CallLogs({super.key});

  @override
  State<CallLogs> createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs> {
 final String? _accessToken = prefs?.getString(authToken);
  final CallLogsRepo repository = CallLogsRepo();
List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    _fetchCallLogs();
  }

  Future<void> _fetchCallLogs() async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      List<CallLogEntry> logs = await _getCallLogs();
      setState(() {
        _callLogs = logs;
        sendCallLogsData(_callLogs);
      });
    }
  }

  Future<List<CallLogEntry>> _getCallLogs() async {
    Iterable<CallLogEntry> entries = await CallLog.get();
    return entries.toList();
  }

  void sendCallLogsData(List<CallLogEntry> _callLogs) async {


// Function to convert a single CallLogEntry object to a Map<String, dynamic>
    Map<String, dynamic> callLogEntryToJson(CallLogEntry callLog) {
      return {
        'name': callLog.name ?? "",
        'number': callLog.number ?? "",
        'formattedNumber': callLog.formattedNumber ?? "",
        'callType': callLog.callType?.name ?? "", // Assuming CallType is an enum or similar; might need adjustment
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
      return callLogs.map((callLog)
      => callLogEntryToJson(callLog)).take(10).toList()
          ;
    }
    var data = {
      "hashedPhone": hashedPhone("029999999999"),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "All Call Logs",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
      body: _callLogs.isNotEmpty
          ? ListView.builder(
              itemCount: _callLogs.length,
              itemBuilder: (context, index) {
                CallLogEntry log = _callLogs[index];
                String callLogString = 'Name: ${log.name}, '
                    'Number: ${log.number}, '
                    'Formatted Number: ${log.formattedNumber}, '
                    'Call Type: ${log.callType}, '
                    'Duration: ${log.duration}, '
                    'Timestamp: ${log.timestamp}, '
                    'Cached Number Type: ${log.cachedNumberType}, '
                    'Cached Number Label: ${log.cachedNumberLabel}, '
                    'Cached Matched Number: ${log.cachedMatchedNumber}, '
                    'Sim Display Name: ${log.simDisplayName}, '
                    'Phone Account Id: ${log.phoneAccountId}';
                return ListTile(
                  title: Text(callLogString),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
