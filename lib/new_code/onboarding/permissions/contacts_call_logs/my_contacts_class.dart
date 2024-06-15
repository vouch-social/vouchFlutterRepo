import 'package:flutter_contacts/flutter_contacts.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/services/hashed_phone.dart';

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
    return contact;
  }).toList();

  int eliminatedCount = entries.length - contactsWithPhones.length;
  print('Number of contacts eliminated: $eliminatedCount');

  // Calculate the total number of phone numbers
  int totalPhoneNumbers = contactsWithPhones.fold(0, (sum, contact) => sum + contact.phones.length);
  print('Total number of phone numbers: $totalPhoneNumbers');

  prefs?.setInt(deviceContacts, totalPhoneNumbers);

  return contactsWithPhones;
}
