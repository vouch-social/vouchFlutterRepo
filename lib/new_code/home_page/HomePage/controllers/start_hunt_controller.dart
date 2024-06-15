import 'package:get/get.dart';
import '/new_code/backend/models/start_hunt_response_model.dart';
import '/new_code/backend/repos/start_hunt_repo.dart';
import '/new_code/home_page/HomePage/controllers/update_bounty_status_controller.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/ignore_bounty_response_model.dart';


class StartHuntController extends GetxController {
  final controller = UpdateBountyStatusController();
  final StartHuntRepo repository = StartHuntRepo();
  var isLoading = false.obs;

  Future<void> startBountyHunt(dynamic bountyId) async {
    var data = {
      "bountyId": bountyId
    };

    isLoading(true);
    try {
      BaseResponse<StartHuntModel> apiResult =
      await repository.startHunt(data);
      if (apiResult.status) {
        print('Api Result Start Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Start Hunt : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
  Future<void> ignoreBounty(dynamic bountyId) async {
    var data = bountyId;
    isLoading(true);
    try {
      BaseResponse<IgnoreBountyModel> apiResult =
      await repository.ignoreBounty(data);
      if (apiResult.status) {
        print('Api Result Ignore Bounty Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Ignore Bounty : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }




}