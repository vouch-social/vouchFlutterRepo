import 'package:vouch/new_code/backend/backend_constants.dart';
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
      print("Response 11: $response");
    } catch (error) {
      print("Error 2 :$error");
    }
  }

  Future<void> sendContacts(dynamic data
      // String? hashedPhone, List<myContact> contacts
      ) async {
    try {
      dio.Response response = await _dioClient.postRequest(
          endPoint: '/api/contacts/saveContacts',
          data: data,
          authToken: prefs?.getString(authToken));

      print("Response : $response");
    } catch (error) {
      print("Error 3 :$error");
    }
  }
}
