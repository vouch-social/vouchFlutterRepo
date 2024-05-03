import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import '../../../main.dart';
import '../backend_constants.dart';
import '../models/base_response.dart';
import '../models/save_user_model.dart';
import '../models/vouch_request_accept_model.dart';
import '../network/dio_client.dart';


class VouchRequestAcceptRepo {

  static final VouchRequestAcceptRepo _instance =
  VouchRequestAcceptRepo._internal();
  late final DioClient _dioClient;

  VouchRequestAcceptRepo._internal() {
    _dioClient = DioClient();
  }

  factory VouchRequestAcceptRepo() => _instance;

  Future<BaseResponse<VouchAcceptModel>> acceptVouch(dynamic data) async {
    try {
      print("dataAcceptVouch $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/pathnodes/vouch-request-update',
          data: data,
          authToken: prefs?.getString(authToken));
      print("AcceptVouchResponse: $response");
      BaseResponse<VouchAcceptModel> result = BaseResponse.fromJson(
          response.data, VouchAcceptModel.fromJson);
      print("Result : $result");
      print("AcceptVouchResponseData: ${response.data}");
      return result;
    } catch (error) {
      print("Error 14 :$error");
      rethrow;
    }
  }
}