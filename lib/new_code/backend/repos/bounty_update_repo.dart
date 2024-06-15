import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_update_resonse_model.dart';
import '../models/raise_bounty_model.dart';
import '../network/dio_client.dart';

class UpdateBountyRepository {
  static final UpdateBountyRepository _instance =
  UpdateBountyRepository._internal();
  late final DioClient _dioClient;

  UpdateBountyRepository._internal() {
    _dioClient = DioClient();
  }
  factory UpdateBountyRepository() => _instance;

  Future<BaseResponse<BountyUpdateModel>> updateBounty(
      dynamic data,dynamic id) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/bounty/myHunts/updateStatus/$id',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Update Bounty $response');
      if (response.data != null) {
        BaseResponse<BountyUpdateModel> result =
        BaseResponse<BountyUpdateModel>.fromJson(
          response.data,
          BountyUpdateModel.fromJson,
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
