import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/attributes_response_model.dart';
import 'package:vouch/new_code/onboarding/customize_profile/tags_screen.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import '../../../auth/checkAuth.dart';
import '../../../main.dart';
import '../../backend/models/base_response.dart';
import '../../backend/repos/get_goals_attributes_repo.dart';
import '../../backend/repos/new_attributes_repo.dart';
import '../../backend/repos/save_attributes_goals_repo.dart';
import '../../home_page/search_screen/search_screen.dart';

class UserDetailsController extends GetxController {
  final AttributesGoalsRepo repository = AttributesGoalsRepo();
  final GetGoalsAttributesRepo getRepository = GetGoalsAttributesRepo();
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  RxList<Tags> tagsController = <Tags>[].obs;
  final headlineController = TextEditingController();
  var isLoading = false.obs;
  final NewAttributesRepo newAttributeRepo = NewAttributesRepo();

  Future<void> saveUserController() async {
    try {
      var data = {
        "name" : nameController.text.toString(),
        "photourl": imageController.text.toString(),
        "localizedheadline" : headlineController.text.toString()
      };
      print("DATA : $data");

      final response = await repository.saveUser(data);

      if (response.status) {
        await checkUser();
        Get.to(() => const SearchScreen());
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error7: $error');
    }
  }


  Future<void> sendUserAttributesController(dynamic attributes) async {

    try {
      var data = {
        "attributes" : attributes
      };
      print("DATA : $data");

      final response = await repository.sendUserAttributes(data);

      if (response.status) {

      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error9: $error');
    }
  }

  Future<AttributesResponseModel> getAttributesExamples() async {
    try {
      isLoading(true);
      BaseResponse<AttributesResponseModel> apiResult = await getRepository.getAttributesRecommendations();

      if (apiResult.status) {
        isLoading(false);
        if(apiResult.data != null && apiResult.data.attributes != null){
          return apiResult.data;
        }else{
          return AttributesResponseModel(attributes: []);
        }
      }
      return apiResult.data;
    } catch (error) {
      print('Error5: $error');
      isLoading(false);
      return AttributesResponseModel(attributes: []);
    }
  }

  Future<void> sendNewAttributesController(String attribute) async {
    try {
      var data = {
        "attribute_name": attribute
      };
      print("DATA : $data");

      final response = await newAttributeRepo.addAttribute(data);

      if (response.status) {
        print("Attributes added Successfully");
      } else {
        print('Status is false');
      }
    } catch (error) {
      print('Error9: $error');
    }
  }


}


