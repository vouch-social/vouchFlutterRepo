// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:contacts_service/contacts_service.dart';

Future<void> contactsToFirebase(String? currentUserPhone) async {
//   final instance = FirebaseFirestore.instance;
//   String formattedCurrentPhoneNumber = cleanPhoneNumber(currentUserPhone!);

//   // 1. Check for User
//   QuerySnapshot userQuery = await instance
//       .collection('users')
//       .where('phone', isEqualTo: formattedCurrentPhoneNumber)
//       .get();

//   // 2. Create User if Not Exists
//   if (userQuery.docs.isEmpty) {
//     await instance.collection('users').add({
//       'phone': formattedCurrentPhoneNumber,
//     });
//   }

//   // 3. Create Kontakts Collection
//   var userQuery2 = instance
//       .collection('users')
//       .where('phone', isEqualTo: formattedCurrentPhoneNumber)
//       .get();
//   var kontaktsCollection;
//   userQuery2.then((querySnapshot) {
//     var userDoc = querySnapshot.docs.first;
//     kontaktsCollection = userDoc.reference.collection('Kontakts');
//   });

//   // Fetch device contacts
//   Iterable<Contact> contacts = await ContactsService.getContacts();

//   // 4. Add Contacts to Kontakts
//   for (Contact contact in contacts) {
//     String? phoneNumber =
//         contact.phones!.isNotEmpty ? contact.phones!.first.value : null;
//     if (phoneNumber != null) {
//       String formattedPhoneNumber = cleanPhoneNumber(phoneNumber);
//       // String hashedPhoneNumber = hashPhoneNumber(formattedPhoneNumber);

//       await kontaktsCollection.add({
//         'name': contact.displayName ?? '',
//         'phone': formattedPhoneNumber,
//         'email': contact.emails!.isNotEmpty ? contact.emails!.first.value : '',
//       });
//     }
//   }
// }

// String cleanPhoneNumber(String phoneNumber) {
//   String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
//   if (formattedPhoneNumber.length > 10 &&
//       formattedPhoneNumber.startsWith('91')) {
//     formattedPhoneNumber = formattedPhoneNumber.substring(2);
//   }
//   if (formattedPhoneNumber.length > 10) {
//     formattedPhoneNumber =
//         formattedPhoneNumber.substring(formattedPhoneNumber.length - 10);
//   }
//   return formattedPhoneNumber;
// }

// String hashPhoneNumber(String phoneNumber) {
//   var bytes = utf8.encode(phoneNumber); // data being hashed
//   var digest = sha256.convert(bytes);
//   return digest.toString();
}
