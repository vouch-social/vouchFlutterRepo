import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/feeds_model.dart';
import 'package:vouch/new_code/backend/repos/feeds_repo.dart';
import '../../../backend/models/base_response.dart';


class FeedsController extends GetxController{
  final HomePageFeedsRepository repository = HomePageFeedsRepository();

  Future<void> getHomePageFeeds() async {
    try {
      BaseResponse<FeedsModel> apiResult =
      await repository.getFeeds();
      if (apiResult.status) {
        print('Api Result Feeds Controller: ${apiResult.message}');

        return apiResult.data;
      }
    } catch (error) {
      print("Error Feeds : $error");
      rethrow;
    }
  }

}