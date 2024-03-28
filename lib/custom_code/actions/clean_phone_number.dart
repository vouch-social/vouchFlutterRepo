// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String cleanPhoneNumber(String phoneNumber) {
  String formPNo = phoneNumber.replaceAll(RegExp(r'\D'), '');
  if (formPNo.length > 10 && formPNo.startsWith("91")) {
    formPNo = formPNo.substring(2);
  }
  if (formPNo.length > 10) {
    formPNo = formPNo.substring(formPNo.length - 10);
  }
  return formPNo;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
