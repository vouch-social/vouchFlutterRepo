import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/update_vouch_response_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_update_resonse_model.dart';
import '../models/raise_bounty_model.dart';
import '../network/dio_client.dart';

class UpdateVouchRepository {
  static final UpdateVouchRepository _instance =
  UpdateVouchRepository._internal();
  late final DioClient _dioClient;

  UpdateVouchRepository._internal() {
    _dioClient = DioClient();
  }
  factory UpdateVouchRepository() => _instance;

  Future<BaseResponse<VouchStatusUpdateModel>> updateVouch(
      dynamic data,dynamic id) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/pathnodes/updatePathStatus/$id',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Update Vouch $response');
      if (response.data != null) {
        BaseResponse<VouchStatusUpdateModel> result =
        BaseResponse<VouchStatusUpdateModel>.fromJson(
          response.data,
          VouchStatusUpdateModel.fromJson,
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
