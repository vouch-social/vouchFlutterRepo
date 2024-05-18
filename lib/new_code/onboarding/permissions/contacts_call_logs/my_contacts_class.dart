import 'package:call_log/call_log.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

Future<List<CallLogEntry>> getCallLogs() async {
  Iterable<CallLogEntry> entries = await CallLog.get();
  return entries.toList();
}

Future<List<Contact>> myGetContacts() async {
  // Fetch contacts with the specified properties
  Iterable<Contact> entries = await FlutterContacts.getContacts(
    withProperties: true,
    withThumbnail: false,
    withPhoto: true,
    withGroups: true,
    withAccounts: true,
  );

  // Filter contacts with phone numbers and set thumbnails to null
  List<Contact> contactsWithPhones = entries.where((contact) => contact.phones.isNotEmpty).map((contact) {
    contact.thumbnail = null; // Set thumbnail to null
    return contact;
  }).toList();

  return contactsWithPhones;
}
