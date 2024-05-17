import 'dart:convert';


CheckUserModel checkUserModelFromJson(String str) => CheckUserModel.fromJson(json.decode(str));

String checkUserModelToJson(CheckUserModel data) => json.encode(data.toJson());

class CheckUserModel {
  Data data;

  CheckUserModel({
    required this.data,
  });

  factory CheckUserModel.fromJson(Map<String, dynamic> json) => CheckUserModel(
    data: Data.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  User user;
  bool contactsSync;
  bool callLogsSync;
  bool linkedinSync;

  Data({
    required this.user,
    required this.contactsSync,
    required this.callLogsSync,
    required this.linkedinSync,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    contactsSync: json["contacts_sync"],
    callLogsSync: json["call_logs_sync"],
    linkedinSync: json["linkedin_sync"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "contacts_sync": contactsSync,
    "call_logs_sync": callLogsSync,
    "linkedin_sync": linkedinSync,
  };
}

class User {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? id;
  dynamic userCreatedAt;
  dynamic name;
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

  User({
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
     this.id,
     this.userCreatedAt,
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    deletedAt: json["deletedAt"],
    id: json["id"],
    userCreatedAt: json["created_at"],
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
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
    "id": id,
    "created_at": userCreatedAt,
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
  };
}