import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/bounty_update_resonse_model.dart';
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import 'package:vouch/new_code/backend/repos/start_hunt_repo.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/repos/bounty_update_repo.dart';


class UpdateBountyStatusController extends GetxController {
  final UpdateBountyRepository repository = UpdateBountyRepository();
  var isLoading = false.obs;

  Future<void> updateBountyStatus(dynamic huntId,dynamic status) async {
    var data = {
      "status": status,
    };

    isLoading(true);
    try {
      BaseResponse<BountyUpdateModel> apiResult =
      await repository.updateBounty(data,huntId);
      if (apiResult.status) {
        print('Api Result Bounty Status Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Bounty Status  : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}