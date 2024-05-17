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
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userDatumCreatedAt;
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
  dynamic deletedAt;
  List<Attribute> attributes;
  List<dynamic> goals;

  UserDatum({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userDatumCreatedAt,
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
    required this.attributes,
    required this.goals,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userDatumCreatedAt: json["created_at"],
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
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    goals: List<dynamic>.from(json["goals"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": userDatumCreatedAt,
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
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "goals": List<dynamic>.from(goals.map((x) => x)),
  };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<dynamic> attributes;

  Attribute({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userId,
    required this.attributes,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attributes: List<String>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}
