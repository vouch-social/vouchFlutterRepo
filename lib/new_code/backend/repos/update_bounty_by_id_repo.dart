import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/update_bounty_by_id_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_update_resonse_model.dart';
import '../models/raise_bounty_model.dart';
import '../network/dio_client.dart';

class UpdateBountyByIdRepository {
  static final UpdateBountyByIdRepository _instance =
  UpdateBountyByIdRepository._internal();
  late final DioClient _dioClient;

  UpdateBountyByIdRepository._internal() {
    _dioClient = DioClient();
  }
  factory UpdateBountyByIdRepository() => _instance;

  Future<BaseResponse<UpdateBountyByIdModel>> updateBounty(
      dynamic data,dynamic id) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/bounty/update/$id',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Update Bounty By Id $response');
      if (response.data != null) {
        BaseResponse<UpdateBountyByIdModel> result =
        BaseResponse<UpdateBountyByIdModel>.fromJson(
          response.data,
          UpdateBountyByIdModel.fromJson,
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
