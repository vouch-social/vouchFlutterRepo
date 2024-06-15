// To parse this JSON data, do
//
//     final saveUserModel = saveUserModelFromJson(jsonString);

import 'dart:convert';

SaveUserModel saveUserModelFromJson(String str) => SaveUserModel.fromJson(json.decode(str));

String saveUserModelToJson(SaveUserModel data) => json.encode(data.toJson());

class SaveUserModel {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic saveUserModelCreatedAt;
  dynamic name;
  dynamic phone;
  dynamic firebaseid;
  dynamic photourl;
  dynamic graphid;
  dynamic hashedphone;
  dynamic linkedinsub;
  dynamic email;
  dynamic vanityname;
  dynamic localizedheadline;
  bool contactsSync;
  bool callLogsSync;
  bool linkedinSync;
  dynamic countryCode;
  dynamic deletedAt;

  SaveUserModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.saveUserModelCreatedAt,
    required this.name,
    required this.phone,
    required this.firebaseid,
    required this.photourl,
    required this.graphid,
    required this.hashedphone,
    required this.linkedinsub,
    required this.email,
    required this.vanityname,
    required this.localizedheadline,
    required this.contactsSync,
    required this.callLogsSync,
    required this.linkedinSync,
    required this.countryCode,
    required this.deletedAt,
  });

  factory SaveUserModel.fromJson(Map<String, dynamic> json) => SaveUserModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    saveUserModelCreatedAt: json["created_at"],
    name: json["name"],
    phone: json["phone"],
    firebaseid: json["firebaseid"],
    photourl: json["photourl"],
    graphid: json["graphid"],
    hashedphone: json["hashedphone"],
    linkedinsub: json["linkedinsub"],
    email: json["email"],
    vanityname: json["vanityname"],
    localizedheadline: json["localizedheadline"],
    contactsSync: json["contacts_sync"],
    callLogsSync: json["call_logs_sync"],
    linkedinSync: json["linkedin_sync"],
    countryCode: json["country_code"],
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": saveUserModelCreatedAt,
    "name": name,
    "phone": phone,
    "firebaseid": firebaseid,
    "photourl": photourl,
    "graphid": graphid,
    "hashedphone": hashedphone,
    "linkedinsub": linkedinsub,
    "email": email,
    "vanityname": vanityname,
    "localizedheadline": localizedheadline,
    "contacts_sync": contactsSync,
    "call_logs_sync": callLogsSync,
    "linkedin_sync": linkedinSync,
    "country_code": countryCode,
    "deletedAt": deletedAt,
  };
}
