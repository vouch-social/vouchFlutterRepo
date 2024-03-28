// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> splitUserShare(String? deepLink) async {
  if (deepLink == null || !deepLink.startsWith('app.vouch.social/user/')) {
    return 'Invalid or missing deep link';
  }
  // Splitting the deep link string to extract the desired part
  List<String> parts = deepLink.split('app.vouch.social/user/');
  if (parts.length < 2) {
    return 'Deep link does not contain the expected data';
  }
  // Returning the extracted string
  return parts[1];
}
