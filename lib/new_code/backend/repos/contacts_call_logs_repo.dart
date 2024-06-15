import 'package:get/get.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/backend/models/send_contacts_response_model.dart';
import '/new_code/home_page/settings/re_sync_contacts/contacts_call_logs/re_sync_upload_success.dart';
import '/new_code/home_page/settings/settings_screen.dart';
import '/new_code/onboarding/linkdin/linkdin_screen.dart';
import '/new_code/onboarding/permissions/contacts_call_logs/upload_success.dart';
import '../../../main.dart';
import '../network/dio_client.dart';
import 'package:dio/dio.dart' as dio;
import '../models/base_response.dart';


class ContactsCallLogsRepo {
  static final ContactsCallLogsRepo _instance =
  ContactsCallLogsRepo._internal();
  late final DioClient _dioClient;

  ContactsCallLogsRepo._internal() {
    _dioClient = DioClient();
  }

  factory ContactsCallLogsRepo() => _instance;

  // Future<void> sendCallLogs(dynamic data) async {
  //   try {
  //     dio.Response response = await _dioClient.postRequest(
  //         endPoint: '/api/call-logs/saveCallLogs',
  //         data: data,
  //         authToken: prefs?.getString(authToken));
  //     prefs?.setBool(sendCallLogsResponse, response.data['status']);
  //     checkImport();
  //     print("sendCallLogs: $response");
  //   } catch (error) {
  //     print("Error 2 :$error");
  //   }
  // }

  Future<BaseResponse<ContactsResponseModel>> sendContacts(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/contacts/saveContacts',
          data: data,
          authToken: prefs?.getString(authToken));

      if (response.data != null) {
        BaseResponse<ContactsResponseModel> result =
        BaseResponse<ContactsResponseModel>.fromJson(
          response.data,
          ContactsResponseModel.fromJson,
        );
        prefs?.setInt(contactsAdded, result.data.totalRecordsRecieved);
        prefs?.setInt(contactsUpdated, result.data.totalRecordsUpdated);
        prefs?.setInt(contactsCreated, result.data.totalRecordsCreated);

        Get.to(() => const ReSyncContactUploadSuccess());


        print("sendContacts : $response");
        return result;
      } else {
        throw Exception('Response data is null');
      }
    } catch (error) {
      print("Error 3 :$error");
      return BaseResponse<ContactsResponseModel>(
        status: false,
        message: 'Failed to send contacts',
        data: ContactsResponseModel(),
      );
    }
  }
}


checkImport() {
  // bool? isCallLog = prefs?.getBool(sendCallLogsResponse);
  bool? isContactLog = prefs?.getBool(sendContactsResponse);
  if ( isContactLog != null && isContactLog) {
    Get.to(() => LinkedinScreen());
  }
}

