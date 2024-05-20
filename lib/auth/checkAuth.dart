import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vouch/new_code/onboarding/permissions/contacts_call_logs/import_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';
import 'package:vouch/new_code/onboarding/welcome_screen/welcome_screen.dart';
import 'firebase_auth/auth_util.dart';
import '../main.dart';
import '../new_code/backend/backend_constants.dart';
import '../new_code/backend/models/base_response.dart';
import '../new_code/backend/models/check_user_model.dart';
import '../new_code/backend/repos/auth_repo.dart';
import '../new_code/home_page/HomePage/new_home_page.dart';
import '../new_code/onboarding/auth_screen/login_screen/components/country_code_remover.dart';
import '../new_code/onboarding/goals/goals_screen.dart';
import '../new_code/onboarding/linkdin/linkdin_screen.dart';

Future<bool> isUserLoggedIn() async {
  if (prefs!.getString(authToken) == null) {
    return false;
  } else if (prefs!.getString(authToken)!.isNotEmpty) {
    if (await checkUser()) {
      print("CheckUserReturn ${checkUser()}");
      return true;
    }
  }
  return false;
}

Future<bool> checkUser() async {
  final AuthRepository repository = AuthRepository();
  var data = {
    'phone': cleanPhone(currentPhoneNumber),
  };
  try {
    BaseResponse<CheckUserModel> apiResult =
        await repository.sendTokenToServer(data['phone']!);
    print("Api REsult Status :${apiResult.status}");

    if (apiResult.status) {
      print("Status is true: ${apiResult.data!.data.user.name}");
      prefs?.setString(userName, (apiResult.data!.data.user.name).toString());
      print("User Name: ${prefs?.getString(userName)}");
      prefs?.setString(imageUrl, apiResult.data!.data.user.photourl);
      print("imageUrl: ${prefs?.getString(imageUrl)}");
      prefs?.setString(
          headline, apiResult.data!.data.user.localizedheadline ?? 'null');
      print("HealdLine : ${prefs?.getString(headline)}");
      prefs?.setString(
          loggedInUserHashedPhone, apiResult.data!.data.user.hashedphone);
      print("HasedPhone : ${prefs?.getString(loggedInUserHashedPhone)}");
      prefs?.setBool(isLinkedinSync, apiResult.data!.data.linkedinSync);
      print("Linkedin : ${prefs?.get(isLinkedinSync)}");
      print("IsContact: ${apiResult.data!.data.contactsSync}");
      prefs?.setBool(isContactSync, apiResult.data!.data.contactsSync);
       prefs?.setStringList(goals, apiResult.data!.data.user.goals[0].goals ?? []);
      // print("Goals : ${prefs?.getStringList(goals)}");
      prefs?.setStringList(
          attributes, apiResult.data!.data.user.attributes[0].attributes ?? []);
      print("Attributes : ${prefs?.getStringList(attributes)}");
      prefs?.setString(phone, apiResult.data!.data.user.phone.toString());
      print("Phone : ${apiResult.data!.data.user.phone}");
      //  await saveAttributes(apiResult.data!.data.user.attributes.attributes);
    }
    return apiResult.status;
  } catch (error) {
    print("Check User : $error");
  }
  return false;
}

Widget newCustomNav() {
  final AuthRepository repository = AuthRepository();
  Future<String> pageName() async {
    var data = {
      'phone': cleanPhone(currentPhoneNumber),
    };
    try {
      BaseResponse<CheckUserModel> apiResult =
          await repository.sendTokenToServer(data['phone']!);
      print("apiResponseCustomNav : ${apiResult.data.data}");
      if (apiResult.data.data.contactsSync == false) {
        return "callLogsPending";
      } else if (!apiResult.data.data.linkedinSync) {
        return "linkedInPending";
      }
    } catch (error) {
      print(error);
    }
    return "";
  }

  return FutureBuilder<String>(
      future: pageName(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == 'callLogsPending') {
          return PermissionsScreen();
        } else if (snapshot.data == "linkedInPending") {
          return LinkedinScreen();
        }
        return NewHomePage();
      });
}
