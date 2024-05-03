import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/vouch_request_accept_model.dart';
import 'package:vouch/new_code/backend/repos/vouch_request_accept_repo.dart';
import '../../../backend/models/base_response.dart';


class AcceptVouchController extends GetxController{
  final VouchRequestAcceptRepo repository = VouchRequestAcceptRepo();
  var isLoading = false.obs;
  Future<void> sendAcceptVouch(dynamic vouchPathId) async {

   var data = {
      "vouchPathId" : vouchPathId,
      "status" : 'accept'
    };

    isLoading(true);
    try {
      BaseResponse<VouchAcceptModel> apiResult =
      await repository.acceptVouch(data);
      if (apiResult.status) {
        print('Api Result Accept Vouch Controller: ${apiResult.message}');
          isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Accept Vouch : $error");
      rethrow;
    } finally{
        isLoading(false);
    }
  }

}