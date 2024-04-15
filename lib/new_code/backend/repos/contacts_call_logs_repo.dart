import 'package:vouch/new_code/backend/backend_constants.dart';

import '../../../main.dart';
import '../../onboarding/permissions/contacts_call_logs/my_contacts_class.dart';
import '../network/dio_client.dart';
import 'package:dio/dio.dart' as dio;

class CallLogsRepo {
  static final CallLogsRepo _instance = CallLogsRepo._internal();
  late final DioClient _dioClient;

  CallLogsRepo._internal() {
    _dioClient = DioClient();
  }
  factory CallLogsRepo() => _instance;

  Future<void> sendCallLogs(dynamic data) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/call-logs/saveCallLogs',
          data: data,
          authToken: prefs?.getString(authToken));
      print("Response 11: $response");
    } catch (error) {
      print("Error 2 :$error");
    }
  }

  Future<void> sendContacts(
      String? hashedPhone, List<myContact> contacts) async {
    try {
      List<Map<String, dynamic>> jsonContacts = myContactListToJson(contacts);
      print(jsonContacts);
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/contacts/saveContacts',
          data:

           {"hashedPhone": hashedPhone, "contacts": jsonContacts},

          authToken: prefs?.getString(authToken));

      print("Response : $response");
    } catch (error) {
      print("Error 3 :$error");
    }
  }

  List<Map<String, dynamic>> myContactListToJson(List<myContact> contacts) {
    return contacts.map((contact) => contact.toJson()).toList();
  }
}
