


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '/new_code/backend/models/my_vouch_history_model.dart';

import '../../backend/models/base_response.dart';
import '../../backend/repos/my_vouch_history_repo.dart';

class VouchController extends GetxController {
  var isLoading = false.obs;
  final MyVouchRepository repository = MyVouchRepository();

  Future<MyVouchHistoryModel> getVouchHistory(
      ) async {
    isLoading(true);
    try {
      BaseResponse<MyVouchHistoryModel> apiResult =
      await repository.getMyVouch();
      if (apiResult.status) {
        return apiResult.data;
      }
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
      return apiResult.data;
    } catch (error) {
      print("Error My Vouch History: $error");
      rethrow;
    }finally{
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }

}