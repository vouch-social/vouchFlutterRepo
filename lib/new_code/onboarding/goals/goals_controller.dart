import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/new_home_page.dart';

import '../../backend/repos/save_attributes_goals_repo.dart';

class GoalsController extends GetxController{

  final AttributesGoalsRepo repository = AttributesGoalsRepo();

  List<TextEditingController> controller = List.generate(3, (index) => TextEditingController());


  Future<void> sendUserGoalsController() async {
    try {
      var data = {
        "goals": controller
      };
      print("DATA : $data");

      final response = await repository.sendUserGoals(data);

      if (response.status) {
        Get.to(() => NewHomePage());
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error5: $error');
    }
  }


}