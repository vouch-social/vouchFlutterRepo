import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'models/check_user_model.dart';

const String contentType = "application/json";
const String authorizationHeaderKey = "Authorization";
const String authorizationHeaderTag = "Authorization";
////////////////////////////////////////////////////////////////////////////////////////////////////
const String authToken = "authToken";
const String loggedInUserHashedPhone = "loggedInUserHashedPhone";
const String initScreen = "initScreen";
const String user = "user";
const String sendContactsResponse = "sendContactsResponse";
const String sendCallLogsResponse = "sendCallLogsResponse";
const String userName = "userName";
const String imageUrl = "imageUrl";
const String headline = "HeadLine";
const String isLinkedinSync = "isLinkedinSync";
const String phone = "phone";
const String goals = "goals";
const String attributes = "attributes";
const String isContactSync = "isContactSync";
const dynamic userId = 'userId';
const dynamic countryCode = 'countryCode';
const dynamic contactsAdded = 'contactsAdded';
const dynamic contactsUpdated = 'contactsUpdated';
const dynamic contactsCreated = 'contactsCreated';
const dynamic deviceContacts = 'deviceContacts';
const String fcmToken = "fcmToken";
const dynamic attributesNew = "attributesNew";
// Function to get the attributesNew list from SharedPreferences
Future<List<AttributesNew>> getAttributesNewList() async {
  final String? attributesNewJson = prefs?.getString(attributesNew);
  if (attributesNewJson != null && attributesNewJson.isNotEmpty) {
    List<dynamic> jsonList = jsonDecode(attributesNewJson);
    List<AttributesNew> attributesNewList = jsonList.map((json) => AttributesNew.fromJson(json)).toList();
    return attributesNewList;
  }
  return [];
}

// Function to access elements index-wise
void accessAttributesNewElements() async {
  List<AttributesNew> attributesNewList = await getAttributesNewList();

  if (attributesNewList.isNotEmpty) {
    for (int i = 0; i < attributesNewList.length; i++) {
      AttributesNew attributeNew = attributesNewList[i];
      print("Element $i:");
      print("Created At: ${attributeNew.createdAt}");
      print("Updated At: ${attributeNew.updatedAt}");
      print("ID: ${attributeNew.id}");
      print("User ID: ${attributeNew.userId}");
      print("Attribute: ${attributeNew.attribute}");
      print("Score: ${attributeNew.score}");
      print("");
    }
  } else {
    print("No attributes found.");
  }
}


