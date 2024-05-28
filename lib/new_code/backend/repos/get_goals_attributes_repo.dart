import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/attributes_response_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/goals_recommendation_model.dart';
import '../models/recommendations_model.dart';
import '../network/dio_client.dart';



class GetGoalsAttributesRepo {
  static final GetGoalsAttributesRepo _instance = GetGoalsAttributesRepo._internal();
  late final DioClient _dioClient;

  GetGoalsAttributesRepo._internal() {
    _dioClient = DioClient();
  }
  factory GetGoalsAttributesRepo() => _instance;

  Future<BaseResponse<GoalsRecommendationResponseModel>> getGoalsRecommendations() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/user/getGoalsRecommendation',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Goals Recommendations Model $response');
      if (response.data != null) {
        BaseResponse<GoalsRecommendationResponseModel> result =
        BaseResponse<GoalsRecommendationResponseModel>.fromJson(
          response.data,
          GoalsRecommendationResponseModel.fromJson,
        );
        print("Result Goals Recommendations: $result");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }



  Future<BaseResponse<AttributesResponseModel>> getAttributesRecommendations() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/user/getAttributesRecommendation',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Attributes Recommendations Model $response');
      if (response.data != null) {
        BaseResponse<AttributesResponseModel> result =
        BaseResponse<AttributesResponseModel>.fromJson(
          response.data,
          AttributesResponseModel.fromJson,
        );
        print("Result Attributes Recommendations: $result");
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
