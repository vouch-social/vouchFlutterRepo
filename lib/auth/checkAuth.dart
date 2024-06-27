import 'dart:convert';
import 'firebase_auth/auth_util.dart';
import '../main.dart';
import '../new_code/backend/backend_constants.dart';
import '../new_code/backend/models/base_response.dart';
import '../new_code/backend/models/check_user_model.dart';
import '../new_code/backend/repos/auth_repo.dart';
import '../new_code/onboarding/auth_screen/login_screen/components/country_code_remover.dart';



Future<bool> checkUser() async {
  final AuthRepository repository = AuthRepository();
  var data = {
    'phone': cleanPhone(currentPhoneNumber),
  };
  try {
    BaseResponse<CheckUserModel> apiResult =
    await repository.sendTokenToServer(data['phone']!);
    print("Api Result Status :${apiResult.status}");
    if (apiResult.status) {
      print("User Id :${apiResult.data!.data.user.id}");
      prefs?.setInt(userId, apiResult.data!.data.user.id);
      print("Status is true: ${apiResult.data!.data.user.name}");
      prefs?.setString(userName, (apiResult.data!.data.user.name).toString());
      print("User Name: ${prefs?.getString(userName)}");
      prefs?.setString(imageUrl, apiResult.data!.data.user.photourl);
      print("imageUrl: ${prefs?.getString(imageUrl)}");
      prefs?.setString(
          headline, apiResult.data!.data.user.localizedheadline ?? 'null');
      print("Headline : ${prefs?.getString(headline)}");
      prefs?.setString(
          loggedInUserHashedPhone, apiResult.data!.data.user.hashedphone);
      print("HashedPhone : ${prefs?.getString(loggedInUserHashedPhone)}");
      prefs?.setBool(isLinkedinSync, apiResult.data!.data.linkedinSync);
      print("Linkedin : ${prefs?.get(isLinkedinSync)}");
      print("IsContact: ${apiResult.data!.data.contactsSync!}");
      prefs?.setBool(isContactSync, apiResult.data!.data.contactsSync);

      if (prefs != null && apiResult.data != null) {
        List<String> userGoals = [];
        if (apiResult.data.data.user.goals.isNotEmpty) {
          var firstGoalEntry = apiResult.data.data.user.goals[0].goals;
          if (firstGoalEntry is List) {
            userGoals = firstGoalEntry.map((goal) => goal.toString()).toList();
          }
        }
        prefs?.setStringList(goals, userGoals);
      }

      if (prefs != null && apiResult.data != null) {
        List<String> userAttributes = [];
        if (apiResult.data.data.user.attributes.isNotEmpty) {
          var firstAttributes = apiResult.data.data.user.attributes[0].attributes;
          if (firstAttributes is List) {
            userAttributes = firstAttributes.map((attribute) => attribute.toString()).toList();
          }
        }
        prefs?.setStringList(attributes, userAttributes);
      }
      print("Attributes : ${prefs?.getStringList(attributes)}");

      List<AttributesNew> attributesNewList = apiResult.data!.data.user.attributesNew ?? [];

      print("New Attributes Print:");
      attributesNewList.forEach((attributeNew) {
        print("Created At: ${attributeNew.createdAt}");
        print("Updated At: ${attributeNew.updatedAt}");
        print("ID: ${attributeNew.id}");
        print("User ID: ${attributeNew.userId}");
        print("Attribute: ${attributeNew.attribute}");
        print("Score: ${attributeNew.score}");
        print("");
      });

      // Serialize the list of AttributesNew objects to a JSON string
      String attributesNewJson = jsonEncode(attributesNewList.map((attributeNew) => attributeNew.toJson()).toList());

      // Save the JSON string to shared preferences
      prefs?.setString(phone, apiResult.data!.data.user.phone.toString());
      print("Phone : ${apiResult.data!.data.user.phone}");
      prefs?.setString(countryCode, apiResult.data!.data.user.countryCode.toString());
      print("Auth Token :${prefs?.getString(authToken)}");
      prefs?.setString(attributesNew, attributesNewJson);
      print("New Attributes JSON: ${prefs?.getString(attributesNew)}");


      accessAttributesNewElements();
    }
    return apiResult.status;
  } catch (error) {
    print("Check User : $error");
  }
  return false;
}

