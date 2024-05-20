import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/my_bounty_history_model.dart';
import 'package:vouch/new_code/backend/repos/my_bounty_history_repo.dart';

import '../../backend/models/base_response.dart';
import '../../backend/models/get_bounty_by_id_model.dart';
import '../../backend/repos/get_bounty_by_id_repo.dart';


class BountyHistoryController extends GetxController {
  var isLoading = false.obs;
  var isDetailsLoading = false.obs;
  final MyBountyHistoryRepository repository = MyBountyHistoryRepository();
  final GetBountyByIdRepo bountyDetailsRepository = GetBountyByIdRepo();
  Future<MyBountyHistoryModel> getBountyHistory() async {
    isLoading(true);
    try {
      BaseResponse<MyBountyHistoryModel> apiResult =
          await repository.getHistory();
      if (apiResult.status) {
        print('Api Result Bounty History : ${apiResult.message}');
        return apiResult.data;
      }
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
      return apiResult.data;
    } catch (error) {
      print("Error Bounty History: $error");
      rethrow;
    } finally {
      Future.delayed(Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }

  Future<GetBountyByIdModel> getBountyHistoryById(dynamic id) async {
    isDetailsLoading(true);
    try {
      BaseResponse<GetBountyByIdModel> apiResult =
      await bountyDetailsRepository.getBountyDetails(id);
      if (apiResult.status) {
        print('Api Result Bounty Details History : ${apiResult.message}');
        print("Bounty History Details : ${apiResult.data.id}");
        return apiResult.data;
      }
      Future.delayed(Duration(milliseconds: 300), () {
        isDetailsLoading(false);
      });
      return apiResult.data;
    } catch (error) {
      print("Error Bounty Details History: $error");
      rethrow;
    } finally {
      Future.delayed(Duration(milliseconds: 300), () {
        isDetailsLoading(false);
      });
    }
  }

}
