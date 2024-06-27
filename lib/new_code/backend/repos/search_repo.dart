import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/search_screen_response_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../network/dio_client.dart';

class SearchRepository {
  static final SearchRepository _instance = SearchRepository._internal();
  late final DioClient _dioClient;

  SearchRepository._internal() {
    _dioClient = DioClient();
  }

  factory SearchRepository() => _instance;

  // Method to handle retries with exponential backoff
  Future<T> retryWithExponentialBackoff<T>(Future<T> Function() apiCall, {int retries = 3, int initialDelay = 1000}) async {
    int attempt = 0;
    int delay = initialDelay;

    while (attempt < retries) {
      try {
        return await apiCall();
      } catch (error) {
        attempt++;
        if (attempt >= retries) {
          rethrow;
        }
        await Future.delayed(Duration(milliseconds: delay));
        delay *= 2; // Exponential backoff
      }
    }
    throw Exception('Max retries exceeded');
  }

  Future<BaseResponse<SearchScreenResponseModel>> getSearch(dynamic data) async {
    return retryWithExponentialBackoff(() async {
      print("Data: $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/dashboard/search',
        data: data,
        authToken: prefs?.getString(authToken),
      );
      print("Data Search: ${response}");
      if (response.data != null) {
        print("Data Search: ${response.data}");
        BaseResponse<SearchScreenResponseModel> result = BaseResponse<SearchScreenResponseModel>.fromJson(
            response.data, SearchScreenResponseModel.fromJson);
        print(result);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    });
  }
}
