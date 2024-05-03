import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import 'package:vouch/new_code/backend/repos/start_hunt_repo.dart';
import '../../../backend/models/base_response.dart';


class StartHuntController extends GetxController {
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
}