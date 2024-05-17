import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/update_vouch_response_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_update_resonse_model.dart';
import '../models/raise_bounty_model.dart';
import '../models/vouch_connect_response_model.dart';
import '../network/dio_client.dart';

class VouchConnectRepository {
  static final VouchConnectRepository _instance =
  VouchConnectRepository._internal();
  late final DioClient _dioClient;

  VouchConnectRepository._internal() {
    _dioClient = DioClient();
  }
  factory VouchConnectRepository() => _instance;

  Future<BaseResponse<VouchConnectModel>> connectVouch(
      dynamic id) async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/pathnodes/vouchConnect/$id',
        data: null,
        bearerToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Connect Vouch $response');
      if (response.data != null) {
        BaseResponse<VouchConnectModel> result =
        BaseResponse<VouchConnectModel>.fromJson(
          response.data,
          VouchConnectModel.fromJson,
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
