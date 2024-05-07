import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/my_bounty_history_model.dart';
import '../network/dio_client.dart';

class MyBountyHistoryRepository {
  static final MyBountyHistoryRepository _instance =
      MyBountyHistoryRepository._internal();
  late final DioClient _dioClient;

  MyBountyHistoryRepository._internal() {
    _dioClient = DioClient();
  }
  factory MyBountyHistoryRepository() => _instance;

  Future<BaseResponse<MyBountyHistoryModel>> getHistory() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/bounty/myBounty',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES My Bounty History $response');
      if (response.data != null) {
        BaseResponse<MyBountyHistoryModel> result =
            BaseResponse<MyBountyHistoryModel>.fromJson(
          response.data,
          MyBountyHistoryModel.fromJson,
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
