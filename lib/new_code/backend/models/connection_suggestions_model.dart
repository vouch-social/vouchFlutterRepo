// To parse this JSON data, do
//
//     final connectionSuggestionsModel = connectionSuggestionsModelFromJson(jsonString);

import 'dart:convert';

ConnectionSuggestionsModel connectionSuggestionsModelFromJson(String str) => ConnectionSuggestionsModel.fromJson(json.decode(str));

String connectionSuggestionsModelToJson(ConnectionSuggestionsModel data) => json.encode(data.toJson());

class ConnectionSuggestionsModel {
  List<RecommendationDatum> recommendationData;

  ConnectionSuggestionsModel({
    required this.recommendationData,
  });

  factory ConnectionSuggestionsModel.fromJson(Map<String, dynamic> json) => ConnectionSuggestionsModel(
    recommendationData: List<RecommendationDatum>.from(json["recommendationData"].map((x) => RecommendationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recommendationData": List<dynamic>.from(recommendationData.map((x) => x.toJson())),
  };
}

class RecommendationDatum {
  dynamic photourl;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic recommendationDatumCreatedAt;
  dynamic name;
  dynamic phone;
  dynamic firebaseid;
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
  dynamic fcm;
  dynamic deletedAt;
  List<Attribute> attributes;
  List<Attribute> goals;

  RecommendationDatum({
     this.photourl,
     this.createdAt,
     this.updatedAt,
     this.id,
     this.recommendationDatumCreatedAt,
     this.name,
     this.phone,
     this.firebaseid,
     this.graphid,
     this.hashedphone,
     this.linkedinsub,
     this.email,
     this.vanityname,
     this.localizedheadline,
     required this.contactsSync,
     required this.callLogsSync,
     required this.linkedinSync,
     this.countryCode,
     this.fcm,
     this.deletedAt,
     required this.attributes,
     required this.goals,
  });

  factory RecommendationDatum.fromJson(Map<String, dynamic> json) => RecommendationDatum(
    photourl: json["photourl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    recommendationDatumCreatedAt: json["created_at"],
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
    fcm: json["fcm"],
    deletedAt: json["deletedAt"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    goals: List<Attribute>.from(json["goals"].map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "photourl": photourl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": recommendationDatumCreatedAt,
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
    "fcm": fcm,
    "deletedAt": deletedAt,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
  };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<String>? attributes;
  List<String>? goals;

  Attribute({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userId,
    this.attributes,
    this.goals,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attributes: json["attributes"] == null ? [] : List<String>.from(json["attributes"]!.map((x) => x)),
    goals: json["goals"] == null ? [] : List<String>.from(json["goals"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x)),
    "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x)),
  };
}
