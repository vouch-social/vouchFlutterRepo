import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/bounty_update_resonse_model.dart';
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import 'package:vouch/new_code/backend/models/update_vouch_response_model.dart';
import 'package:vouch/new_code/backend/repos/start_hunt_repo.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/bounty_update_repo.dart';
import '../../../backend/repos/update_vouch_status_repo.dart';


class UpdateVouchStatusController extends GetxController {
  final UpdateVouchRepository repository = UpdateVouchRepository();
  var isLoading = false.obs;

  Future<void> updateVouchStatus(dynamic vouchId,dynamic status) async {
    var data = {
      "status": status
    };

    isLoading(true);
    try {
      BaseResponse<VouchStatusUpdateModel> apiResult =
      await repository.updateVouch(data,vouchId);
      if (apiResult.status) {
        print('Api Result Vouch Status Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Vouch Status  : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}