import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/search_recommendation_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../network/dio_client.dart';

class GetSearchDemoRepo {
  static final GetSearchDemoRepo _instance = GetSearchDemoRepo._internal();
  late final DioClient _dioClient;

  GetSearchDemoRepo._internal() {
    _dioClient = DioClient();
  }
  factory GetSearchDemoRepo() => _instance;

  Future<BaseResponse<SearchBarRecommendationModel>> getSearchSuggestionRepo() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/dashboard/getSearchBarMessage',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Search Message Suggestion $response');
      if (response.data != null) {
        BaseResponse<SearchBarRecommendationModel> result =
        BaseResponse<SearchBarRecommendationModel>.fromJson(
          response.data,
          SearchBarRecommendationModel.fromJson,
        );
        print("Result Search Message Suggestion: $result");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
