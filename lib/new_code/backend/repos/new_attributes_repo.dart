import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/models/attributes_model.dart';
import 'package:vouch/new_code/backend/models/new_attribute_response_model.dart';
import '../../../main.dart';
import '../backend_constants.dart';
import '../models/base_response.dart';
import '../models/delete_attribute_response_model.dart';
import '../models/save_user_model.dart';
import '../network/dio_client.dart';


class NewAttributesRepo{

  static final NewAttributesRepo _instance =
  NewAttributesRepo._internal();
  late final DioClient _dioClient;

  NewAttributesRepo._internal() {
    _dioClient = DioClient();
  }
  factory NewAttributesRepo() => _instance;

  Future<BaseResponse<NewAttributeModel>> addAttribute( dynamic data) async {
    try {
      print("data $data");
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/user/add-attribute',
          data: data,
          authToken: prefs?.getString(authToken));
      print("saveUser newAttribute: $response");
      BaseResponse<NewAttributeModel> result = BaseResponse.fromJson(
          response.data, NewAttributeModel.fromJson);
      print("Result : $result");
      print("saveUser Attributes: ${response.data}");
      return result;
    } catch (error) {
      print("Error 6 :$error");
      rethrow;
    }
  }

  Future<BaseResponse<DeleteAttributeResponseModel>> deleteAttribute(dynamic attributeId) async {
    try {
      dio.Response response = await _dioClient.getRequest(
          endPoint: '/api/user/delete-attribute/$attributeId',
          data: null,
          bearerToken: prefs?.getString(authToken));
      BaseResponse<DeleteAttributeResponseModel> result = BaseResponse.fromJson(
          response.data, DeleteAttributeResponseModel.fromJson);
      print("delete Attributes: $response");
      return result;
    } catch (error) {
      print("Error 4 :$error");
      rethrow;
    }
  }



}