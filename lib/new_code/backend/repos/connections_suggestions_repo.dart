import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/connection_suggestions_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/recommendations_model.dart';
import '../network/dio_client.dart';



class ConnectionsSuggestionsRepo {
  static final ConnectionsSuggestionsRepo _instance = ConnectionsSuggestionsRepo._internal();
  late final DioClient _dioClient;

  ConnectionsSuggestionsRepo._internal() {
    _dioClient = DioClient();
  }
  factory ConnectionsSuggestionsRepo() => _instance;

  Future<BaseResponse<ConnectionSuggestionsModel>> getRecommendations() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/dashboard/mutual-recommendations',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Connections Suggestions Model $response');
      if (response.data != null) {
        BaseResponse<ConnectionSuggestionsModel> result =
        BaseResponse<ConnectionSuggestionsModel>.fromJson(
          response.data,
          ConnectionSuggestionsModel.fromJson,
        );
        print("Result Connections: $result");
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
