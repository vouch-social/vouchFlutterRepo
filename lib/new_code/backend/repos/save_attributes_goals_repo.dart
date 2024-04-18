import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/models/attributes_model.dart';
import '../../../main.dart';
import '../backend_constants.dart';
import '../models/base_response.dart';
import '../models/save_user_model.dart';
import '../network/dio_client.dart';


class AttributesGoalsRepo{

  static final AttributesGoalsRepo _instance =
  AttributesGoalsRepo._internal();
  late final DioClient _dioClient;

  AttributesGoalsRepo._internal() {
    _dioClient = DioClient();
  }
  factory AttributesGoalsRepo() => _instance;

  Future<BaseResponse<SaveUserModel>> saveUser( dynamic data) async {
    try {
      print("data $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/user/save-user',
          data: data,
          authToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5MTE4OTE0OTIiLCJzdWIiOjQ1LCJpYXQiOjE3MTM0MzQwMDIsImV4cCI6MTc0NDk5MTYwMn0.g1oGq_w406U9__BY6Q9ry_6DE90j5iosn6C7fcE6lmE");
      print("saveUser: $response");
      BaseResponse<SaveUserModel> result = BaseResponse.fromJson(
          response.data, SaveUserModel.fromJson);
      print("Result : $result");
      print("saveUser: ${response.data}");
      return result;
    } catch (error) {
      print("Error 6 :$error");
      rethrow;
    }
  }

  Future<BaseResponse<AttributesModel>> sendUserGoals(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/user/save-goals',
          data: data,
          authToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5MTE4OTE0OTIiLCJzdWIiOjQ1LCJpYXQiOjE3MTM0MzQwMDIsImV4cCI6MTc0NDk5MTYwMn0.g1oGq_w406U9__BY6Q9ry_6DE90j5iosn6C7fcE6lmE");
      BaseResponse<AttributesModel> result = BaseResponse.fromJson(
          response.data, AttributesModel.fromJson);
      print("sendGoals: $response");
      return result;
    } catch (error) {
      print("Error 4 :$error");
      rethrow;
    }
  }


  Future<BaseResponse<AttributesModel>> sendUserAttributes(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/user/save-attributes',
          data: data,
          authToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5MTE4OTE0OTIiLCJzdWIiOjQ1LCJpYXQiOjE3MTM0MzQwMDIsImV4cCI6MTc0NDk5MTYwMn0.g1oGq_w406U9__BY6Q9ry_6DE90j5iosn6C7fcE6lmE");
      BaseResponse<AttributesModel> result = BaseResponse.fromJson(
          response.data, AttributesModel.fromJson);
      print("sendAttributes: $response");
      return result;
    } catch (error) {
      print("Error 8 :$error");
      rethrow;
    }
  }


}