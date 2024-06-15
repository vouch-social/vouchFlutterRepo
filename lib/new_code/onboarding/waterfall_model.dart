import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';
import '/new_code/home_page/search_screen/search_screen.dart';
import '/new_code/onboarding/customize_profile/user_details.dart';
import '/new_code/onboarding/goals/goals_screen.dart';
import '/new_code/onboarding/linkdin/linkdin_screen.dart';
import '/new_code/onboarding/permissions/permissions_screen.dart';
import '/new_code/onboarding/welcome_screen/welcome_screen.dart';

import '../../main.dart';

  /// if user !loggedin navigate to welcome
  /// if iscontactsync != true = contacts
  /// if user name == null && linkedin == false navigate to linkedin
  /// if username != null && linkedin != true navigate to goals
  /// if goals == null navigate to goals
  /// else navigate to homepage

  Widget navigateToPage() {
    if (prefs?.getString(authToken) == null) {
   return const WelcomeScreen();
    }
    else if(prefs?.getString(userName) == "null"){
      return const UserDetails();
    }else {
      return const SearchScreen();
      // return SearchScreen();
    }


    // else if (prefs!.getBool(isContactSync)! == false) {
    //   return const PermissionsScreen();
    // } else if (prefs?.getString(userName) == "null" && prefs!.getBool(isLinkedinSync)! != true) {
    // return const LinkedinScreen();
    // } else if (prefs!.getStringList(goals)!.isEmpty) {
    // return const GoalsScreen();
    // } else {
    // return const NewHomePage();
    // }
  }
