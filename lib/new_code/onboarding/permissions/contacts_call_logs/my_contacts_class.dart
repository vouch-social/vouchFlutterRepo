// import 'package:call_log/call_log.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

// Future<List<CallLogEntry>> getCallLogs() async {
//   Iterable<CallLogEntry> entries = await CallLog.get();
//   return entries.toList();
// }

Future<List<Contact>> myGetContacts() async {
  // Fetch contacts with the specified properties
  Iterable<Contact> entries = await FlutterContacts.getContacts(
    withProperties: true,
    withThumbnail: false,
    withPhoto: false,
    withGroups: false,
    withAccounts: false,
  );

  List<Contact> contactsWithPhones = entries.where((contact) => contact.phones.isNotEmpty).map((contact) {
    contact.displayName = contact.displayName ?? " ";
    contact.thumbnail = null; // Set thumbnail to null
    // Optionally, clear other properties if they are not needed
    contact.emails = [];
    contact.addresses = [];
    contact.events = [];
    contact.notes = [];
    contact.organizations = [];
    return contact;
  }).toList();

  return contactsWithPhones;
}

