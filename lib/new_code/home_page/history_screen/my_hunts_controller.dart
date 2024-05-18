import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/my_bounty_history_model.dart';
import 'package:vouch/new_code/backend/models/my_hunts_model.dart';
import 'package:vouch/new_code/backend/repos/my_hunts_repo.dart';

import '../../backend/models/base_response.dart';

class HuntsController extends GetxController {
  var isLoading = false.obs;

  final MyHuntsRepository repository = MyHuntsRepository();

  Future<MyHuntsModel> getHuntsHistory() async {
    isLoading(true);
    try {
      BaseResponse<MyHuntsModel> apiResult =
      await repository.getMyHuntsHistory();
      if (apiResult.status) {
        print('Api Result Hunts History : ${apiResult.message}');
        return apiResult.data;
      }
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
      return apiResult.data;
    } catch (error) {
      print("Error Hunts History: $error");
      rethrow;
    } finally {
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }
}
