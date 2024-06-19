import 'package:get/get.dart';
import 'package:vouch/new_code/backend/models/recommendations_model.dart';
import 'package:vouch/new_code/backend/repos/connections_suggestions_repo.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/connection_suggestions_model.dart';
import '../../../backend/models/new_recommendations_model.dart';
import '../../../backend/repos/recommendations_repo.dart';

class ConnectionsSuggestionsController extends GetxController {
  final ConnectionsSuggestionsRepo repository = ConnectionsSuggestionsRepo();
  var isLoading = false.obs;

  Future<ConnectionSuggestionsModel> getRecommendationsData() async {
    try {
      isLoading(true);
      BaseResponse<ConnectionSuggestionsModel> apiResult =
      await repository.getRecommendations();
      if (apiResult.status) {
        print('Api Result Recommendations : ${apiResult.message}');
        Future.delayed(const Duration(milliseconds: 300), () {
          isLoading(false);
        });
        print("Suggestion Controller Data ${apiResult.data.recommendationData}");
        return (apiResult.data);
      }
      return (apiResult.data);
    } catch (error) {
      print("Error Recommendations: $error");
      rethrow;
    } finally {
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }
}