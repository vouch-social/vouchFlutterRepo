import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/recommendations_model.dart';
import 'package:vouch/new_code/home_page/paths_screen/paths_screen.dart';

import '../../backend/models/base_response.dart';
import '../../backend/models/paths_model.dart';
import '../../backend/repos/paths_recommendations_repo.dart';
import '../../backend/repos/recommendations_repo.dart';

class RecommendationsController extends GetxController{
  final RecommendationsRepo repository = RecommendationsRepo();
  var isLoading = false.obs;

  Future<GetRecommendationsModel> getRecommendationsData() async {
    try {
      isLoading(true);
      BaseResponse<GetRecommendationsModel> apiResult =
      await repository.getRecommendations();
      if (apiResult.status) {
        print('Api Result Recommendations : ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        return apiResult.data;

      }
      return apiResult.data;
    } catch (error) {
      print("Error Recommendations: $error");
      rethrow;
    }finally{
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });    }
  }






}