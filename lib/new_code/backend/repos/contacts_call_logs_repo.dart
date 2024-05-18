import 'package:get/get.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'package:vouch/new_code/onboarding/linkdin/linkdin_screen.dart';
import '../../../main.dart';
import '../network/dio_client.dart';
import 'package:dio/dio.dart' as dio;

class ContactsCallLogsRepo {
  static final ContactsCallLogsRepo _instance =
      ContactsCallLogsRepo._internal();
  late final DioClient _dioClient;

  ContactsCallLogsRepo._internal() {
    _dioClient = DioClient();
  }
  factory ContactsCallLogsRepo() => _instance;

  Future<void> sendCallLogs(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/call-logs/saveCallLogs',
          data: data,
          authToken: prefs?.getString(authToken));
      prefs?.setBool(sendCallLogsResponse, response.data['status']);
      checkImport();
      print("sendCallLogs: $response");
    } catch (error) {
      print("Error 2 :$error");
    }
  }

  Future<void> sendContacts(dynamic data
      ) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/contacts/saveContacts',
          data: data,
          authToken: prefs?.getString(authToken));
      prefs?.setBool(sendContactsResponse, response.data['status']);
      checkImport();
      print("sendContacts : $response");
    } catch (error) {
      print("Error 3 :$error");
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

