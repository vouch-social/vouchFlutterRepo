// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:contacts_service/contacts_service.dart';

Future<List<UserContactStruct>> getPhoneContacts() async {
  FFAppState().ContactListIterable = false;
  Set<String> uniqueHashedPhoneNumbers = Set<String>();
  List<UserContactStruct> hashedContactsList = <UserContactStruct>[];
  FFAppState().hashedContactCount = 0;

  try {
    Iterable<Contact> contacts = await ContactsService.getContacts();

    for (Contact contact in contacts) {
      String contactName = contact.displayName ?? "Unknown";

      // Iterate over all phone numbers of the contact
      for (Item phoneNumber in contact.phones!) {
        String? phoneNumberValue = phoneNumber.value;

        if (phoneNumberValue != null) {
          String formattedPhoneNumber = cleanPhoneNumber(phoneNumberValue);
          String hashedPhoneNumber = hashPhoneNumber(formattedPhoneNumber);

          // Check if hashedPhoneNumber is already in the set
          if (!uniqueHashedPhoneNumbers.contains(hashedPhoneNumber)) {
            uniqueHashedPhoneNumbers.add(hashedPhoneNumber); // Add to the set
            hashedContactsList.add(UserContactStruct(
                hashedPhone: hashedPhoneNumber,
                contactName: contactName)); // Add to the list
            FFAppState().hashedContactCount++;
          }
        }
      }
    }
  } catch (e) {
    print("Error fetching contacts: $e");
  }

  FFAppState().ContactListIterable = true;
  return hashedContactsList;
}

String cleanPhoneNumber(String phoneNumber) {
  String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  if (formattedPhoneNumber.length > 10 &&
      formattedPhoneNumber.startsWith('91')) {
    formattedPhoneNumber = formattedPhoneNumber.substring(2);
  }
  if (formattedPhoneNumber.length > 10) {
    formattedPhoneNumber =
        formattedPhoneNumber.substring(formattedPhoneNumber.length - 10);
  }
  return formattedPhoneNumber;
}

String hashPhoneNumber(String phoneNumber) {
  var bytes = utf8.encode(phoneNumber); // data being hashed
  var digest = sha256.convert(bytes);
  return digest.toString();
}
