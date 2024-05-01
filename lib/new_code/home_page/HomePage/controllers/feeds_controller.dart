import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/feeds_model.dart';
import 'package:vouch/new_code/backend/repos/feeds_repo.dart';
import '../../../backend/models/base_response.dart';


class FeedsController extends GetxController{
  final HomePageFeedsRepository repository = HomePageFeedsRepository();
  var isLoading = false.obs;
  Future<FeedsModel> getHomePageFeeds() async {
    isLoading(true);
    try {
      BaseResponse<FeedsModel> apiResult =
      await repository.getFeeds();
      if (apiResult.status) {
        print('Api Result Feeds Controller: ${apiResult.message}');

        isLoading(false);
        return apiResult.data;
      }
      return apiResult.data;
    } catch (error) {
      print("Error Feeds : $error");
      rethrow;
    } finally{
      isLoading(false);
    }
  }

}