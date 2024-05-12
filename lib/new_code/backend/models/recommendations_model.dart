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
  String createdAt;
  String updatedAt;
  int id;
  String recommendationDatumCreatedAt;
  String name;
  String phone;
  String firebaseid;
  String photourl;
  String graphid;
  String hashedphone;
  String linkedinsub;
  String email;
  String vanityname;
  String localizedheadline;
  bool contactsSync;
  bool callLogsSync;
  bool linkedinSync;
  dynamic countryCode;
  dynamic deletedAt;
  List<dynamic> attributes;
  List<dynamic> goals;

  RecommendationDatum({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.recommendationDatumCreatedAt,
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
    required this.attributes,
    required this.goals,
  });

  factory RecommendationDatum.fromJson(Map<String, dynamic> json) => RecommendationDatum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    recommendationDatumCreatedAt: json["created_at"],
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
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    goals: List<dynamic>.from(json["goals"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": recommendationDatumCreatedAt,
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
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "goals": List<dynamic>.from(goals.map((x) => x)),
  };
}
