import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';
import 'package:vouch/new_code/backend/models/recommendations_model.dart';
import '../../../main.dart';
import '../models/attributes_model.dart';
import '../models/base_response.dart';
import '../models/paths_model.dart';
import '../models/send_path_response_model.dart';
import '../models/user_data_model.dart';
import '../network/dio_client.dart';

class PathsRepository {
  static final PathsRepository _instance = PathsRepository._internal();
  late final DioClient _dioClient;

  PathsRepository._internal() {
    _dioClient = DioClient();
  }
  factory PathsRepository() => _instance;

  Future<BaseResponse<AllPaths>> getPaths(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/pathnodes/search-path',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Get Paths $response');
      if (response.data != null) {
        BaseResponse<AllPaths> result = BaseResponse<AllPaths>.fromJson(
          response.data,
          AllPaths.fromJson,
        );
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<BaseResponse<SendPathResponseModel>> sendSelectedPath(
      dynamic data) async {
    try {
      print("dataOfSelectedPath: $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/pathnodes/selected-path',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Send Paths $response');
      if (response.data != null) {
        BaseResponse<SendPathResponseModel> result =
            BaseResponse<SendPathResponseModel>.fromJson(
          response.data,
          SendPathResponseModel.fromJson,
        );
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
