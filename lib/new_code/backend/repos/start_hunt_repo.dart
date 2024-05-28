import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/models/ignore_bounty_response_model.dart';
import 'package:vouch/new_code/backend/models/start_hunt_response_model.dart';
import '../../../main.dart';
import '../backend_constants.dart';
import '../models/base_response.dart';
import '../models/save_user_model.dart';
import '../network/dio_client.dart';


class StartHuntRepo {

  static final StartHuntRepo _instance =
  StartHuntRepo._internal();
  late final DioClient _dioClient;

  StartHuntRepo._internal() {
    _dioClient = DioClient();
  }

  factory StartHuntRepo() => _instance;

  Future<BaseResponse<StartHuntModel>> startHunt(dynamic data) async {
    try {
      print("dataHunt $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/bounty/start-hunt',
          data: data,
          authToken: prefs?.getString(authToken));
      print("StartHuntResponse: $response");
      BaseResponse<StartHuntModel> result = BaseResponse.fromJson(
          response.data, StartHuntModel.fromJson);
      print("Result : $result");
      print("StartHuntResponseData: ${response.data}");
      return result;
    } catch (error) {
      print("Error 13 :$error");
      rethrow;
    }
  }

  Future<BaseResponse<IgnoreBountyModel>> ignoreBounty(dynamic data) async {
    try {
      print("dataHunt $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/bounty/ignore-hunt/$data',
          data: null,
          authToken: prefs?.getString(authToken));
      print("Ignore Bounty Response: $response");
      BaseResponse<IgnoreBountyModel> result = BaseResponse.fromJson(
          response.data, IgnoreBountyModel.fromJson);
      print("Result : $result");
      print("Ignore BountyResponseData: ${response.data}");
      return result;
    } catch (error) {
      print("Error 18 :$error");
      rethrow;
    }
  }

}