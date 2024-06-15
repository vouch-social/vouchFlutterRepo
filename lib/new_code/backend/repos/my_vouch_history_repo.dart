import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/my_vouch_history_model.dart';
import '../network/dio_client.dart';

class MyVouchRepository {
  static final MyVouchRepository _instance = MyVouchRepository._internal();
  late final DioClient _dioClient;

  MyVouchRepository._internal() {
    _dioClient = DioClient();
  }
  factory MyVouchRepository() => _instance;

  Future<BaseResponse<MyVouchHistoryModel>> getMyVouch() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/pathnodes/mySelectedPath',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES My Vouch History $response');
      if (response.data != null) {
        BaseResponse<MyVouchHistoryModel> result =
            BaseResponse<MyVouchHistoryModel>.fromJson(
          response.data,
          MyVouchHistoryModel.fromJson,
        );
        print("Result My Vouch History: $result");
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
