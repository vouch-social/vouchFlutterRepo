import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/search_screen/search_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import 'package:vouch/new_code/onboarding/linkdin/linkdin_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';
import 'package:vouch/new_code/onboarding/welcome_screen/welcome_screen.dart';

import '../../main.dart';



  Widget navigateToPage() {
    if (prefs?.getString(authToken) == null ) {
   return const WelcomeScreen();
    }
    else if(prefs?.getString(userName) == "null"){
      return const UserDetails();
    }else {
      return const SearchScreen();
    }
  }
