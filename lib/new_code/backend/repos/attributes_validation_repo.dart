import 'package:dio/dio.dart' as dio;
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/backend/models/all_notifications_model.dart';
import '../../../main.dart';
import '../models/attribute_validation_response_model.dart';
import '../models/attributes_validation_model.dart';
import '../models/base_response.dart';
import '../models/recommendations_model.dart';
import '../network/dio_client.dart';



class AttributesValidationRepo {
  static final AttributesValidationRepo _instance = AttributesValidationRepo._internal();
  late final DioClient _dioClient;

  AttributesValidationRepo._internal() {
    _dioClient = DioClient();
  }
  factory AttributesValidationRepo() => _instance;

  Future<BaseResponse<AttributesValidationModel>> getAttributesValidation() async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/user/validations/today',
        bearerToken: '${prefs!.getString(authToken)}',
        data: null,
      );
      print('DIO RES Attributes Validation Model $response');
      if (response.data != null) {
        BaseResponse<AttributesValidationModel> result =
        BaseResponse<AttributesValidationModel>.fromJson(
          response.data,
          AttributesValidationModel.fromJson,
        );
        print("Result Attributes Validation : $result");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<BaseResponse<AttributesValidationResponseModel>> postAttributesValidation(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/user/validate-attribute',
        authToken: '${prefs!.getString(authToken)}',
        data: data,
      );
      print('DIO RES Attributes Validation  $response');
      if (response.data != null) {
        BaseResponse<AttributesValidationResponseModel> result =
        BaseResponse<AttributesValidationResponseModel>.fromJson(
          response.data,
          AttributesValidationResponseModel.fromJson,
        );
        print("Result Attributes Validation : $result");
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
