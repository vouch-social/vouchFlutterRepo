// To parse this JSON data, do
//
//     final getRecommendationsModel = getRecommendationsModelFromJson(jsonString);

import 'dart:convert';

GetRecommendationsModel getRecommendationsModelFromJson(String str) => GetRecommendationsModel.fromJson(json.decode(str));

String getRecommendationsModelToJson(GetRecommendationsModel data) => json.encode(data.toJson());

class GetRecommendationsModel {
  List<RecommendationDatum> recommendationData;

  GetRecommendationsModel({
    required this.recommendationData,
  });

  factory GetRecommendationsModel.fromJson(Map<String, dynamic> json) => GetRecommendationsModel(
    recommendationData: List<RecommendationDatum>.from(json["recommendationData"].map((x) => RecommendationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recommendationData": List<dynamic>.from(recommendationData.map((x) => x.toJson())),
  };
}

class RecommendationDatum {
  String goal;
  List<UserDatum> userData;

  RecommendationDatum({
    required this.goal,
    required this.userData,
  });

  factory RecommendationDatum.fromJson(Map<String, dynamic> json) => RecommendationDatum(
    goal: json["goal"],
    userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "goal": goal,
    "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
  };
}

class UserDatum {
  dynamic id;
  dynamic fcm;
  dynamic name;
  dynamic email;
  List<Attribute> goals;
  dynamic phone;
  dynamic reason;
  dynamic graphid;
  dynamic photourl;
  dynamic createdAt;
  dynamic deletedAt;
  dynamic updatedAt;
  List<Attribute> attributes;
  dynamic userDatumCreatedAt;
  dynamic firebaseid;
  dynamic vanityname;
  dynamic hashedphone;
  dynamic linkedinsub;
  dynamic countryCode;
  dynamic contactsSync;
  dynamic linkedinSync;
  dynamic callLogsSync;
  dynamic localizedheadline;

  UserDatum({
     this.id,
     this.fcm,
     this.name,
     this.email,
    required this.goals,
     this.phone,
     this.reason,
     this.graphid,
     this.photourl,
     this.createdAt,
     this.deletedAt,
     this.updatedAt,
    required this.attributes,
     this.userDatumCreatedAt,
     this.firebaseid,
     this.vanityname,
     this.hashedphone,
     this.linkedinsub,
     this.countryCode,
     this.contactsSync,
     this.linkedinSync,
     this.callLogsSync,
     this.localizedheadline,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
    id: json["id"],
    fcm: json["fcm"],
    name: json["name"],
    email: json["email"],
    goals: List<Attribute>.from(json["goals"].map((x) => Attribute.fromJson(x))),
    phone: json["phone"],
    reason: json["reason"],
    graphid: json["graphid"],
    photourl: json["photourl"],
    createdAt: json["createdAt"],
    deletedAt: json["deletedAt"],
    updatedAt: json["updatedAt"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    userDatumCreatedAt: json["created_at"],
    firebaseid: json["firebaseid"],
    vanityname: json["vanityname"],
    hashedphone: json["hashedphone"],
    linkedinsub: json["linkedinsub"],
    countryCode: json["country_code"],
    contactsSync: json["contacts_sync"],
    linkedinSync: json["linkedin_sync"],
    callLogsSync: json["call_logs_sync"],
    localizedheadline: json["localizedheadline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fcm": fcm,
    "name": name,
    "email": email,
    "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
    "phone": phone,
    "reason": reason,
    "graphid": graphid,
    "photourl": photourl,
    "createdAt": createdAt,
    "deletedAt": deletedAt,
    "updatedAt": updatedAt,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "created_at": userDatumCreatedAt,
    "firebaseid": firebaseid,
    "vanityname": vanityname,
    "hashedphone": hashedphone,
    "linkedinsub": linkedinsub,
    "country_code": countryCode,
    "contacts_sync": contactsSync,
    "linkedin_sync": linkedinSync,
    "call_logs_sync": callLogsSync,
    "localizedheadline": localizedheadline,
  };
}

class Attribute {
  int id;
  int userId;
  String createdAt;
  String updatedAt;
  List<String>? attributes;
  List<String>? goals;

  Attribute({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.attributes,
    this.goals,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    userId: json["user_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    attributes: json["attributes"] == null ? [] : List<String>.from(json["attributes"]!.map((x) => x)),
    goals: json["goals"] == null ? [] : List<String>.from(json["goals"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x)),
    "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x)),
  };
}
