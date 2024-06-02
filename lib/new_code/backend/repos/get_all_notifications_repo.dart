import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/all_notifications_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/recommendations_model.dart';
import '../network/dio_client.dart';



class AllNotificationsRepo {
  static final AllNotificationsRepo _instance = AllNotificationsRepo._internal();
  late final DioClient _dioClient;

  AllNotificationsRepo._internal() {
    _dioClient = DioClient();
  }
  factory AllNotificationsRepo() => _instance;

  Future<BaseResponse<AllNotificationsModel>> getAllNotifications() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/notifications/',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Notifications Model $response');
      if (response.data != null) {
        BaseResponse<AllNotificationsModel> result =
        BaseResponse<AllNotificationsModel>.fromJson(
          response.data,
          AllNotificationsModel.fromJson,
        );
        print("Result Notifications: $result");
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
