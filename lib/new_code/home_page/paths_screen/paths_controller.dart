import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/paths_screen/path_success_screen.dart';

import '../../backend/models/attributes_model.dart';
import '../../backend/models/base_response.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/models/send_path_response_model.dart';
import '../../backend/repos/paths_recommendations_repo.dart';

class PathsController extends GetxController {


  final PathsRepository repository = PathsRepository();
  final contextController = TextEditingController();

  Future<void> sendPath(
      {required List<Map<String, dynamic>> pathList, required int length, required double strength,}) async {
    var data = {
      "pathData": {
        "path": pathList,
        "length": length,
        "strength": strength
      },
      "context": contextController.text
    };

    try {
      BaseResponse<SendPathResponseModel> apiResult =
      await repository.sendSelectedPath(data);
      print("Send Data : $data");
      if (apiResult.status) {
        print('Api Result Send Selected Path : ${apiResult.message}');
        Get.to(() => const PathSuccessScreen());
      }
      else{
        Get.snackbar("Alert", "You can not start more that one vouch!");
        Get.to(() => NewHomePage());
      }
    } catch (error) {
      print("Error getPathList: $error");
      rethrow;
    }
  }

}
