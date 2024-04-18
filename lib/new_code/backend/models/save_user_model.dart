import 'dart:convert';

SaveUserModel saveUserModelFromJson(String str) => SaveUserModel.fromJson(json.decode(str));

String saveUserModelToJson(SaveUserModel data) => json.encode(data.toJson());

class SaveUserModel {
  Data data;

  SaveUserModel({
    required this.data,
  });

  factory SaveUserModel.fromJson(Map<String, dynamic> json) => SaveUserModel(
    data: Data.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  String? createdAt;
  String? updatedAt;
  int? id;
  String? dataCreatedAt;
  String? name;
  String? phone;
  String? firebaseid;
  String? photourl;
  String? graphid;
  String? hashedphone;
  String? linkedinsub;
  String? email;
  String? vanityname;
  String? localizedheadline;
  bool? contactsSync;
  bool? callLogsSync;
  bool? linkedinSync;
  int? countryCode;
  dynamic deletedAt;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.dataCreatedAt,
    this.name,
    this.phone,
    this.firebaseid,
    this.photourl,
    this.graphid,
    this.hashedphone,
    this.linkedinsub,
    this.email,
    this.vanityname,
    this.localizedheadline,
    this.contactsSync,
    this.callLogsSync,
    this.linkedinSync,
    this.countryCode,
    this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    dataCreatedAt: json["created_at"],
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
    "created_at": dataCreatedAt,
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
