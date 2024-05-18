import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../backend/backend_constants.dart';
import '../../../backend/repos/save_attributes_goals_repo.dart';

class EditGoalsController extends GetxController{

  final AttributesGoalsRepo repository = AttributesGoalsRepo();

  List<TextEditingController> controller = List.generate(3, (index) => TextEditingController(text: prefs!.getStringList(goals)?[index].toString()));


  Future<void> sendUserEditedGoalsController() async {
    try {
      var data = {
        "goals": [
          controller[0].text,
          controller[1].text,
          controller[2].text
        ]
      };
      print("DATA : $data");

      final response = await repository.sendUserGoals(data);

      if (response.status) {
        print('Edit Goals response : ${response.data}');
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error5: $error');
    }
  }
}

