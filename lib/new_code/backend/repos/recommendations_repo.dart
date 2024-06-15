import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/recommendations_model.dart';
import '../network/dio_client.dart';



class RecommendationsRepo {
  static final RecommendationsRepo _instance = RecommendationsRepo._internal();
  late final DioClient _dioClient;

  RecommendationsRepo._internal() {
    _dioClient = DioClient();
  }
  factory RecommendationsRepo() => _instance;

  Future<BaseResponse<GetRecommendationsModel>> getRecommendations() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/dashboard/recommendations',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Recommendations Model $response');
      if (response.data != null) {
        BaseResponse<GetRecommendationsModel> result =
        BaseResponse<GetRecommendationsModel>.fromJson(
          response.data,
          GetRecommendationsModel.fromJson,
        );
        print("Result Recommendations: $result");
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
