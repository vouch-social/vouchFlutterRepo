import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/get_bounty_by_id_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/my_vouch_history_model.dart';
import '../network/dio_client.dart';

class GetBountyByIdRepo {
  static final GetBountyByIdRepo _instance = GetBountyByIdRepo._internal();
  late final DioClient _dioClient;

  GetBountyByIdRepo._internal() {
    _dioClient = DioClient();
  }
  factory GetBountyByIdRepo() => _instance;

  Future<BaseResponse<GetBountyByIdModel>> getBountyDetails(dynamic id) async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/bounty/$id',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Bounty Details $response');
      if (response.data != null) {
        BaseResponse<GetBountyByIdModel> result =
        BaseResponse<GetBountyByIdModel>.fromJson(
          response.data,
          GetBountyByIdModel.fromJson,
        );
        print("Result Bounty Details: $result");
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
