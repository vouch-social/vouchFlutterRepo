// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getPhone(String userId) async {
  final instance = FirebaseFirestore.instance;

  try {
    // Retrieve the specific user document based on userId
    var userDoc = await instance.collection('users').doc(userId).get();

    // Extract the phone number from the user document
    return userDoc.data()?['phone_number'] ?? 'Not available';
  } catch (e) {
    // Handle any errors that occur during the fetch operation
    print("Error fetching phone number: $e");
    return 'Error';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
