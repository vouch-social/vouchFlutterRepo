import 'package:dio/dio.dart' as dio;
import '/new_code/backend/backend_constants.dart';
import '/new_code/backend/models/add_ignore_contacts_model.dart';
import '/new_code/backend/models/get_all_contacts_model.dart';
import '/new_code/backend/models/remove_ignored_contacts_model.dart';
import '../../../main.dart';
import '../models/base_response.dart';
import '../models/bounty_tags_model.dart';
import '../models/raise_bounty_model.dart';
import '../network/dio_client.dart';

class IgnoreContactsRepository {
  static final IgnoreContactsRepository _instance =
  IgnoreContactsRepository._internal();
  late final DioClient _dioClient;

  IgnoreContactsRepository._internal() {
    _dioClient = DioClient();
  }
  factory IgnoreContactsRepository() => _instance;

  Future<BaseResponse<AddIgnoreListModel>> ignoreContacts(
      dynamic data) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/contacts/ignoreContact',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Ignore Contacts $response');
      if (response.data != null) {
        BaseResponse<AddIgnoreListModel> result =
        BaseResponse<AddIgnoreListModel>.fromJson(
          response.data,
          AddIgnoreListModel.fromJson,
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


  Future<BaseResponse<RemoveIgnoreListModel>> removeIgnoreContacts(
      dynamic data) async {
    try {
      print("Data $data");
      dio.Response response = await _dioClient.postRequest(
        endPoint: '/api/contacts/ignoreRemoveContact',
        data: data,
        authToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Remove Ignore Contacts $response');
      if (response.data != null) {
        BaseResponse<RemoveIgnoreListModel> result =
        BaseResponse<RemoveIgnoreListModel>.fromJson(
          response.data,
          RemoveIgnoreListModel.fromJson,
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


  Future<BaseResponse<GetAllContactsModel>> getAllContacts(
    ) async {
    try {
      dio.Response response = await _dioClient.getRequest(
        endPoint: '/api/contacts/list-all-contact',
        data: null,
        bearerToken: '${prefs!.getString(authToken)}',
      );
      print('DIO RES Get All Contacts $response');
      if (response.data != null) {
        BaseResponse<GetAllContactsModel> result =
        BaseResponse<GetAllContactsModel>.fromJson(
          response.data,
          GetAllContactsModel.fromJson,
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
