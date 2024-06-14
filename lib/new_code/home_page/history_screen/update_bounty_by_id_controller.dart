import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/update_bounty_by_id_model.dart';
import '../../backend/models/base_response.dart';
import '../../backend/repos/update_bounty_by_id_repo.dart';


class UpdateBountyByIdController extends GetxController {
  final UpdateBountyByIdRepository repository = UpdateBountyByIdRepository();
  var isLoading = false.obs;

  Future<void> updateBountyById(dynamic bountyId,dynamic status,dynamic expiry) async {
    isLoading(true);
    var data = {
      "status": status,
      'expiry': expiry
    };
    try {
      BaseResponse<UpdateBountyByIdModel> apiResult =
      await repository.updateBounty(data,bountyId);
      if (apiResult.status) {
        print('Api Result Update Bounty By Id Controller: ${apiResult.message}');
        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Bounty Update by Id  : $error");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}