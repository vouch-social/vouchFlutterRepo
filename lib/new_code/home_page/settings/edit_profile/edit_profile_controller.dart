import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/settings/edit_profile/edit_tags_screen.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

import '../../../backend/models/attributes_response_model.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/save_user_model.dart';
import '../../../backend/repos/get_goals_attributes_repo.dart';
import '../../../backend/repos/save_attributes_goals_repo.dart';

class EditProfileController extends GetxController{
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  RxList<Tags> tagsController = <Tags>[].obs;
  final headlineController = TextEditingController();
  final AttributesGoalsRepo repository = AttributesGoalsRepo();
  final GetGoalsAttributesRepo getRepository = GetGoalsAttributesRepo();
  var isLoading = false.obs;


  Future<SaveUserModel> saveUserController() async {
    try {
      var data = {
        "name" : nameController.text,
        "localizedheadline" : headlineController.text,
        "photourl": imageController.text,
      };
      print("DATA : $data");

      BaseResponse<SaveUserModel> apiResult = await repository.saveUser(data);

      if (apiResult.status) {
        return apiResult.data;
      }
      else {
        print('Status is false');
      }
      return apiResult.data;
    } catch (error) {
      print('Error7: $error');
      rethrow;
    }
  }

  Future<void> sendUserAttributesController(dynamic attributes,) async {
    // List<String> stringList = tagsController.map((tag) => tag.tags).toList();

    try {
      var data = {
        "attributes" : attributes
      };
      print("DATA : $data");

      final response = await repository.sendUserAttributes(data);

      if (response.status) {
        Get.back();
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
      print('Edit attributes: $error');
      isLoading(false);
      return AttributesResponseModel(attributes: []);
    }
  }


}