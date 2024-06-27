// To parse this JSON data, do
//
//     final checkUserModel = checkUserModelFromJson(jsonString);

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
  dynamic callLogsSync;
  bool linkedinSync;

  Data({
    required this.user,
    required this.contactsSync,
     this.callLogsSync,
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
  dynamic photourl;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userCreatedAt;
  dynamic name;
  dynamic phone;
  dynamic firebaseid;
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
  dynamic deletedAt;
  List<Attribute> attributes;
  List<Goal> goals;
  List<AttributesNew> attributesNew;

  User({
     this.photourl,
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userCreatedAt,
     this.name,
     this.phone,
     this.firebaseid,
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
    required this.attributes,
    required this.goals,
    required this.attributesNew
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    photourl: json["photourl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userCreatedAt: json["created_at"],
    name: json["name"],
    phone: json["phone"],
    firebaseid: json["firebaseid"],
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
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    attributesNew: List<AttributesNew>.from(json["attributes_new"].map((x) => AttributesNew.fromJson(x))),
    goals: List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "photourl": photourl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": userCreatedAt,
    "name": name,
    "phone": phone,
    "firebaseid": firebaseid,
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
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
    "attributes_new": List<dynamic>.from(attributesNew.map((x) => x.toJson())),
  };
}

class AttributesNew {
  String createdAt;
  String updatedAt;
  int id;
  int userId;
  String attribute;
  int score;

  AttributesNew({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.attribute,
    required this.score,
  });

  factory AttributesNew.fromJson(Map<String, dynamic> json) => AttributesNew(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attribute: json["attribute"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "attribute": attribute,
    "score": score,

  };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<dynamic>? attributes;

  Attribute({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userId,
    this.attributes,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attributes: json["attributes"] == null ? [] : List<String>.from(json["attributes"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x)),
  };
}
class Goal {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<dynamic>? goals;

  Goal({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.userId,
    this.goals,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    goals: json["goals"] == null ? [] : List<String>.from(json["goals"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x)),
  };
}
