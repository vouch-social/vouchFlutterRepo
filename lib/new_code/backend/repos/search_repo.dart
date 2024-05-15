import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';
import 'package:vouch/new_code/backend/models/search_screen_response_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/user_data_model.dart';
import '../network/dio_client.dart';


class SearchRepository {
  static final SearchRepository _instance = SearchRepository._internal();
  late final DioClient _dioClient;

  SearchRepository._internal() {
    _dioClient = DioClient();
  }

  factory SearchRepository() => _instance;


  Future<BaseResponse<SearchScreenResponseModel>> getSearch(dynamic data) async {
    try {
      print("DAta $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/dashboard/search',
          data: data,
          authToken: prefs?.getString(authToken));
      print("Data Search : ${response}");
      if (response.data != null) {
        print("Data Search : ${response.data}");
        BaseResponse<SearchScreenResponseModel> result = BaseResponse<SearchScreenResponseModel>.fromJson(
            response.data, SearchScreenResponseModel.fromJson);
        print(result);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print("My First Error $error");
      rethrow;
    }
  }
}