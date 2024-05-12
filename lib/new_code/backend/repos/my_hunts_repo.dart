import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/my_hunts_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/my_vouch_history_model.dart';
import '../network/dio_client.dart';

class MyHuntsRepository {
  static final MyHuntsRepository _instance = MyHuntsRepository._internal();
  late final DioClient _dioClient;

  MyHuntsRepository._internal() {
    _dioClient = DioClient();
  }
  factory MyHuntsRepository() => _instance;

  Future<BaseResponse<MyHuntsModel>> getMyHuntsHistory() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/bounty/myHunts/list',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES My Hunts History $response');
      if (response.data != null) {
        BaseResponse<MyHuntsModel> result =
        BaseResponse<MyHuntsModel>.fromJson(
          response.data,
          MyHuntsModel.fromJson,
        );
        print("Result My Hunts History: $result");
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
