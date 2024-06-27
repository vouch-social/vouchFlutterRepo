import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/maintenance_mode_model.dart';
import '../models/user_data_model.dart';
import '../network/dio_client.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  late final DioClient _dioClient;

  AuthRepository._internal() {
    _dioClient = DioClient();
  }
  factory AuthRepository() => _instance;


  Future<T> retry<T>(Future<T> Function() apiCall, {int retries = 3, int delay = 1000}) async {
    int attempt = 0;
    while (attempt < retries) {
      try {
        return await apiCall();
      } catch (error) {
        attempt++;
        if (attempt >= retries) {
          rethrow;
        }
        await Future.delayed(Duration(milliseconds: delay * attempt));
      }
    }
    throw Exception('Max retries exceeded');
  }

  Future<BaseResponse<UserModel>> sendUser(String firebaseId, String phone, String hashedPhone, String countryCode, dynamic fcmToken) async {
    return retry(() async {
      Map<String, dynamic> requestData = {
        'firebaseid': firebaseId,
        'phone': phone,
        'hashedphone': hashedPhone,
        'country_code': countryCode,
        'fcm_token': fcmToken
      };
      print("Data 1 :$requestData");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/auth/login',
        data: requestData,
        authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjkxODcwMDM0MjkwMSIsInN1YiI6NDUsImlhdCI6MTcxMjU3MjQyMiwiZXhwIjoxNzQ0MTMwMDIyfQ.ZiRcVsoDakk2I8hR9tfwuN0B3nt9zbT9IomdClTxoVw',
      );

      if (response.data != null) {
        print("Data : ${response.data}");
        BaseResponse<UserModel> result = BaseResponse<UserModel>.fromJson(response.data, UserModel.fromJson);
        print(result);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    });
  }

  Future<BaseResponse<CheckUserModel>> sendTokenToServer(String phone) async {
    return retry(() async {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/auth/check_login',
        data: {'phone': phone},
        bearerToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Check User $response');
      if (response.data != null) {
        BaseResponse<CheckUserModel> result = BaseResponse<CheckUserModel>.fromJson(response.data, CheckUserModel.fromJson);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    });
  }
  Future<BaseResponse<MaintenanceModeModel>> checkMaintenance() async {
    return retry(() async {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/settings/maintenance-mode',
        data: null,
        bearerToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Maintenance Mode $response');
      if (response.data != null) {
        BaseResponse<MaintenanceModeModel> result = BaseResponse<MaintenanceModeModel>.fromJson(response.data, MaintenanceModeModel.fromJson);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    });
  }
}
