
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/bounty_tags_model.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import '../../backend/models/base_response.dart';
import '../../backend/models/raise_bounty_model.dart';
import '../../backend/repos/raise_bounty_repo.dart';


enum ResponseTime { Immediately, Within24Hrs, Within72Hrs }


class BountyController extends GetxController{

  final bountyContextController = TextEditingController();
  final linkedinUrlController = TextEditingController();
  final responseTimeController = TextEditingController();
  var isLoading = false.obs;

  List<String> selectedContexts = [];
  void toggleChipSelection(String label) {
    if (selectedContexts.contains(label)) {
      selectedContexts.remove(label);
    } else {
      selectedContexts.add(label);
    }
    update();
  }

  ResponseTime selectedResponseTime = ResponseTime.Immediately;

  void updateResponseTime(ResponseTime value) {
    selectedResponseTime = value;
    switch (value) {
      case ResponseTime.Immediately:
        responseTimeController.text = '1';
        break;
      case ResponseTime.Within24Hrs:
        responseTimeController.text = '2';
        break;
      case ResponseTime.Within72Hrs:
        responseTimeController.text = '3';
        break;
      default:
        responseTimeController.text = '2';
    }
    print(responseTimeController.text);
    update();
  }



  final RaiseBountyRepository repository = RaiseBountyRepository();
  //var urgency =  0;

  Future<void> sendRaisedBounty(int urgency) async {
   // urgency = int.parse(responseTimeController.text);

    var data = {
      "message": linkedinUrlController.text,
      "tags" :  selectedContexts,
      "urgency": urgency
    };

    try {
      BaseResponse<RaiseBountyResponseModel> apiResult =
      await repository.raiseBounty(data);
      print("Send Data : $data");
      if (apiResult.status) {
        print('Api Result Raised Bounty : ${apiResult.message}');
        //Get.to(() => const NewHomePage());
      }
    } catch (error) {
      print("Error raise bounty: $error");
      rethrow;
    }
  }

  Future<BountyTagsModel> getBountyTags() async {
    try {
      isLoading(true);
      BaseResponse<BountyTagsModel> apiResult =
      await repository.bountyTags();
      if (apiResult.status) {
        print('Api Result Bounty Tags : ${apiResult.message}');
       // Get.to(() => const NewHomePage());
        isLoading(false);
        if(apiResult.data != null && apiResult.data.bountyTagsAll != null){
          return apiResult.data;
        }else{
          return BountyTagsModel(bountyTagsAll: []);
        }
      }
      return apiResult.data;
    } catch (error) {
      print("Error get bounty tags: $error");
      return BountyTagsModel(bountyTagsAll: []);
      rethrow;
    }
  }



}


