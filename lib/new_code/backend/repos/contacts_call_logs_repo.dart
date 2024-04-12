import 'dart:convert';

import 'package:vouch/new_code/contacts_call_logs/my_contacts_class.dart';

import '../network/dio_client.dart';
import 'package:dio/dio.dart' as dio;
class CallLogsRepo{

  static final CallLogsRepo _instance = CallLogsRepo._internal();
  late final DioClient _dioClient;

  CallLogsRepo._internal() {
    _dioClient = DioClient();
  }
  factory CallLogsRepo() => _instance;


  Future<void> sendCallLogs(dynamic data) async{
    try{
       dio.Response response = await _dioClient.postRequest(
           endPoint: '/api/call-logs/saveCallLogs',
           data: data
           ,authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5OTk5OTk5OTkiLCJzdWIiOjU3LCJpYXQiOjE3MTI4NDEwODEsImV4cCI6MTc0NDM5ODY4MX0.UleQJFE2OZMXSCzSlC50jr3Bu9NLY0zF73NEO_epct8');
       print("Response : $response");
    }catch(error){
      print("Error 2 :$error");
    }

  }


  Future<void> sendContacts(String? hashedPhone, List<myContact> contacts) async{
    try{
      List<Map<String, dynamic>> jsonContacts = myContactListToJson(contacts);
      dio.Response response = await _dioClient.postRequest(endPoint: '/api/contacts/saveContacts',data: {"hashedPhone":hashedPhone,"contacts": jsonContacts},authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk5OTk5OTk5OTgiLCJzdWIiOjU4LCJpYXQiOjE3MTI4NDIwMDYsImV4cCI6MTc0NDM5OTYwNn0.JyJnmPOo4Su_F6KME5OGXo4IHVCfTPSZDcwptyqJY34');
      print("Response : $response");
    }catch(error){
      print("Error 3 :$error");
    }

  }
  List<Map<String, dynamic>> myContactListToJson(List<myContact> contacts) {
    return contacts.map((contact) => contact.toJson()).toList();
  }

}