import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../backend/backend_constants.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/goals_recommendation_model.dart';
import '../../../backend/repos/get_goals_attributes_repo.dart';
import '../../../backend/repos/save_attributes_goals_repo.dart';

class EditGoalsController extends GetxController{

  final AttributesGoalsRepo repository = AttributesGoalsRepo();
  final GetGoalsAttributesRepo getRepository = GetGoalsAttributesRepo();
  var isLoading = false.obs;
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
        Get.back();
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error5: $error');
    }
  }


  Future<GoalsRecommendationResponseModel> getGoalsExamples() async {
    try {
      isLoading(true);
      BaseResponse<GoalsRecommendationResponseModel> apiResult = await getRepository.getGoalsRecommendations();

      if (apiResult.status) {
        isLoading(false);
        if(apiResult.data != null && apiResult.data.goals != null){
          return apiResult.data;
        }else{
          return GoalsRecommendationResponseModel(goals: []);
        }
      }
      return apiResult.data;
    } catch (error) {
      print('Error5: $error');
      isLoading(false);
      return GoalsRecommendationResponseModel(goals: []);
    }
  }

}

