import 'package:call_log/call_log.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

Future<List<CallLogEntry>> getCallLogs() async {
  Iterable<CallLogEntry> entries = await CallLog.get();
  return entries.toList();
}

Future<List<Contact>> myGetContacts() async {
  Iterable<Contact> entries = await FlutterContacts.getContacts(
      withProperties: true,
     withThumbnail : true,
     withPhoto : true,
     withGroups : true,
     withAccounts : true,
  );
  return entries.where((contact) => contact.phones.isNotEmpty).toList();
}