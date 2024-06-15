// To parse this JSON data, do
//
//     final contactsResponseModel = contactsResponseModelFromJson(jsonString);

import 'dart:convert';

ContactsResponseModel contactsResponseModelFromJson(String str) => ContactsResponseModel.fromJson(json.decode(str));

String contactsResponseModelToJson(ContactsResponseModel data) => json.encode(data.toJson());

class ContactsResponseModel {
  dynamic totalRecordsRecieved;
  dynamic totalRecordsCreated;
  dynamic totalRecordsUpdated;

  ContactsResponseModel({
    this.totalRecordsRecieved,
    this.totalRecordsCreated,
    this.totalRecordsUpdated,
  });

  factory ContactsResponseModel.fromJson(Map<String, dynamic> json) => ContactsResponseModel(
    totalRecordsRecieved: json["totalRecordsRecieved"],
    totalRecordsCreated: json["totalRecordsCreated"],
    totalRecordsUpdated: json["totalRecordsUpdated"],
  );

  Map<String, dynamic> toJson() => {
    "totalRecordsRecieved": totalRecordsRecieved,
    "totalRecordsCreated": totalRecordsCreated,
    "totalRecordsUpdated": totalRecordsUpdated,
  };
}
