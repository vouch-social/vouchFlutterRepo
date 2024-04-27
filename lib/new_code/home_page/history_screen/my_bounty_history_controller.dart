import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/my_raised_bounty_history_model.dart';
import 'package:vouch/new_code/backend/repos/my_raised_bounty_history_repo.dart';

import '../../backend/models/base_response.dart';
import 'my_bounty_history.dart';

class BountyController extends GetxController{

  final MyBountyHistoryRepository repository = MyBountyHistoryRepository();

  Future<MyBountyHistoryModel> getBountyHistory(
      ) async {
    try {
      BaseResponse<MyBountyHistoryModel> apiResult =
      await repository.getHistory();
      if (apiResult.status) {
        print('Api Result Bounty History : ${apiResult.message}');
        print("Bounty History : ${apiResult.data.data.myBountyListData[0].id}");
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Bounty History: $error");
      rethrow;
    }
  }


}