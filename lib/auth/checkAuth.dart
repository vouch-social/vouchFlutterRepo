import 'package:flutter/material.dart';
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
    if(apiResult.status){
      prefs?.setString(userName, apiResult.data!.data.user.name);
      print("User Name: ${prefs?.getString(userName)}");
      prefs?.setString(imageUrl, apiResult.data!.data.user.photourl ?? 'null');
      print("imageUrl: ${prefs?.getString(imageUrl)}");
      prefs?.setString(headline, apiResult.data!.data.user.localizedheadline ?? 'null');
      print("HealdLine : ${prefs?.getString(headline)}");
      prefs?.setString(loggedInUserHashedPhone, apiResult.data!.data.user.hashedphone);
      prefs?.setBool(isLinkedinSync, apiResult.data!.data.linkedinSync);
      print("Linkedin : ${prefs?.get(isLinkedinSync)}");

    }
    return apiResult.status;
  } catch (error) {
    print(error);
  }
  return false;
}

Widget newCustomNav(){
  final AuthRepository repository = AuthRepository();
  Future<String> pageName() async {
    var data = {
      'phone': cleanPhone(currentPhoneNumber),
    };
    try {
      BaseResponse<CheckUserModel> apiResult =
      await repository.sendTokenToServer(data['phone']!);
      print("apiResponseCustomNav : ${apiResult.data.data}");
      if (!apiResult.data.data.linkedinSync) {
        return"linkedInPending";
      } else if (!apiResult.data.data.callLogsSync) {
        return "callLogsPending";
      }
    } catch (error) {
      print(error);
    }
    return "";
  }

  return FutureBuilder<String>(
      future: pageName(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if(snapshot.data == 'callLogsPending'){
          return ImportScreen();
        }else if (snapshot.data == "linkedInPending") {
          return LinkedinScreen();
        }
        return NewHomePage();
      });
}