import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/user_data_model.dart';
import '../network/dio_client.dart';


class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  late final DioClient _dioClient;

  AuthRepository._internal() {
    _dioClient = DioClient();
  }
  factory AuthRepository() => _instance;


  Future<BaseResponse<UserModel>> sendUser(String firebaseid, String phone, String hashedphone,String country_code) async {
    try {
      Map<String, dynamic> requestData = {
        'firebaseid': firebaseid,
        'phone': phone,
        'hashedphone': hashedphone,
        'country_code':country_code
      };
      dio.Response response = await _dioClient.postRequest(endPoint: '/api/auth/login', data: requestData,authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjkxODcwMDM0MjkwMSIsInN1YiI6NDUsImlhdCI6MTcxMjU3MjQyMiwiZXhwIjoxNzQ0MTMwMDIyfQ.ZiRcVsoDakk2I8hR9tfwuN0B3nt9zbT9IomdClTxoVw');

      if (response.data != null) {
        print("Data : ${response.data}"); //   response.data =
      //
      //   {
      //     "message": "Login Success",
      //     "data": {
      //       "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5OTk5OTk5OTkiLCJzdWIiOjU3LCJpYXQiOjE3MTI5MTI1MTAsImV4cCI6MTc0NDQ3MDExMH0.9ALHx7g7v9bMF-VB7CpmhzAxYyyhGwZ3m00LajdKAPE",
      //       "user": {
      //         "createdAt": "April 9, 2024, 13:04:47",
      //         "updatedAt": "April 9, 2024, 13:04:47",
      //         "id": 57,
      //         "created_at": "null",
      //         "name": "null",
      //         "phone": "9999999999",
      //         "firebaseid": "awz0fDGReXZAbMrYOffsraKJwrm2",
      //         "photourl": "null",
      //         "graphid": "null",
      //         "hashedphone": "ce3a598687c8d2e5aa6bedad20e059b4a78cca0adad7e563b07998d5cd226b8c",
      //         "linkedinsub": "null",
      //         "email": "null",
      //         "vanityname": "null",
      //         "localizedheadline": "null",
      //         "contacts_sync": false,
      //         "call_logs_sync": false,
      //         "linkedin_sync": false,
      //         "country_code": 91,
      //         "deletedAt": "null"
      //       },
      //       "user_status": "old",
      //       "contacts_sync": false,
      //       "call_logs_sync": false,
      //       "linkedin_sync": false
      //     },
      //     "status": true,
      //     "meta": "null"
      // };



        BaseResponse<UserModel> result = BaseResponse<UserModel>.fromJson(response.data, UserModel.fromJson);
        print(result);
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch(error) {
      print("My First Error $error");
      rethrow;
    }
  }


  Future<BaseResponse<CheckUserModel>> sendTokenToServer(String phone) async {

try{
      dio.Response response = await _dioClient.getRequest(endPoint: '/api/auth/check_login', data: {phone: phone},bearerToken: '${prefs!.getString(authToken)}',);
      print('DIO RES $response');
      if (response.data != null) {
        BaseResponse<CheckUserModel> result = BaseResponse<CheckUserModel>.fromJson(response.data, CheckUserModel.fromJson,);
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
