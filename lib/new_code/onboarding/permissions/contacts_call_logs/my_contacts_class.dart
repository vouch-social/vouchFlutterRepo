import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';

import '../../../../main.dart';

Future<List<Contact>> myGetContacts() async {
  Iterable<Contact> entries = await FlutterContacts.getContacts(
    withProperties: true,
    withThumbnail: false,
    withPhoto: false,
    withGroups: false,
    withAccounts: false,
  );

  print('Total number of contacts on the phone: ${entries.length}');

  List<Contact> contactsWithPhones = entries.where((contact) => contact.phones.isNotEmpty).map((contact) {
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

  prefs?.setInt(deviceContacts, contactsWithPhones.length);

  return contactsWithPhones;
}
