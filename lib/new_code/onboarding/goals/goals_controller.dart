import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/new_code/backend/models/goals_recommendation_model.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';

import '../../backend/models/base_response.dart';
import '../../backend/repos/get_goals_attributes_repo.dart';
import '../../backend/repos/save_attributes_goals_repo.dart';

class GoalsController extends GetxController{

  final AttributesGoalsRepo repository = AttributesGoalsRepo();
  final GetGoalsAttributesRepo getRepository = GetGoalsAttributesRepo();
  var isLoading = false.obs;
  List<TextEditingController> controller = List.generate(3, (index) => TextEditingController());

  Future<void> sendUserGoalsController() async {
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
        Get.off(() => const NewHomePage());
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