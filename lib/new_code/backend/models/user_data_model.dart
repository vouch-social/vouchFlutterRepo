import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());


class UserModel {
  Data data;

  UserModel({
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("UserModel : $json");

    var t = UserModel(
      data: Data.fromJson(json),
    );
    print("T:$t");
    return t;
  }

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  dynamic accessToken;
  User user;
  dynamic userStatus;
  dynamic contactsSync;
  dynamic callLogsSync;
  dynamic linkedinSync;

  Data({
     this.accessToken,
    required this.user,
     this.userStatus,
     this.contactsSync,
     this.callLogsSync,
     this.linkedinSync,
  });

  factory Data.fromJson(Map<String, dynamic> json){
    print("data.fromJson : ${json["user"]}");
    return
    Data(
      accessToken: json["access_token"],
      user: User.fromJson(json["user"]),
      userStatus: json["user_status"],
      contactsSync: json["contacts_sync"],
      callLogsSync: json["call_logs_sync"],
      linkedinSync: json["linkedin_sync"],
    );
  }
  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "user": user.toJson(),
    "user_status": userStatus,
    "contacts_sync": contactsSync,
    "call_logs_sync": callLogsSync,
    "linkedin_sync": linkedinSync,
  };
}

class User {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic id;
  dynamic userCreatedAt;
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
  dynamic contactsSync;
  dynamic callLogsSync;
  dynamic linkedinSync;
  dynamic countryCode;

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

  factory User.fromJson(Map<String, dynamic> json) {
    print("user.fromJson : $json");
    return User(
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
      contactsSync: json["contacts_sync"] == null ? null : json["contacts_sync"] as bool,
      callLogsSync: json["call_logs_sync"] == null ? null : json["call_logs_sync"] as bool,
      linkedinSync: json["linkedin_sync"] == null ? null : json["linkedin_sync"] as bool,
      countryCode: json["country_code"],
    );
  }

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


