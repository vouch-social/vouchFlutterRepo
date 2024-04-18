import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/onboarding/customize_profile/tags_screen.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import '../../backend/repos/save_attributes_goals_repo.dart';

class UserDetailsController extends GetxController {
  final AttributesGoalsRepo repository = AttributesGoalsRepo();

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  RxList<Tags> tagsController = <Tags>[].obs;
  final headlineController = TextEditingController();

  Future<void> saveUserController() async {
    try {
      var data = {
        "name" : nameController.text,
        "localizedheadline" : headlineController.text,
        "photourl": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAYGBgYHBgcICAcKCwoLCg8ODAwODxYQERAREBYiFRkVFRkVIh4kHhweJB42KiYmKjY",
      };
      print("DATA : $data");

      final response = await repository.saveUser(data);

      if (response.status) {
        sendUserAttributesController();
        //Get.to(() => GoalsScreen());
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error7: $error');
    }
  }


  Future<void> sendUserAttributesController() async {
    List<String> stringList = tagsController.map((tag) => tag.tags).toList();

    try {
      var data = {
        "attributes" : stringList
      };
      print("DATA : $data");

      final response = await repository.sendUserAttributes(data);

      if (response.status) {
        Get.to(() => GoalsScreen());
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error9: $error');
    }
  }


}

