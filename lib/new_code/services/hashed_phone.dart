// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:crypto/crypto.dart';

String cleanPhoneNumber(String phoneNumber) {
  String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  return formattedPhoneNumber;
}

extractCountryCode(String phoneNumber) {
  String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  String countryCode = '';

  if (formattedPhoneNumber.length > 10) {
    if (formattedPhoneNumber.startsWith('91')) {
      countryCode = '91';
    } else {
      countryCode =
          formattedPhoneNumber.substring(0, formattedPhoneNumber.length - 10);
    }
  }
  return countryCode;
}

String hashedPhone(String? userPhone,String? userPhoneCC)  {
  if (userPhone != null && userPhone.isNotEmpty) {
    // Clean the phone number before hashing
    String phone = "$userPhoneCC$userPhone";
    // Convert the cleaned phone number to bytes and hash it
    var bytes = utf8.encode(phone);
    var hashedPhone = sha256.convert(bytes);

    // Set the hashed phone number in FFAppState
    FFAppState().hashedPhone = hashedPhone.toString();
    return hashedPhone.toString();
  } else {
    print("Phone number is null or empty");
    return '';
  }
}