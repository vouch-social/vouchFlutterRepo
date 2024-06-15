// To parse this JSON data, do
//
//     final searchScreenResponseModel = searchScreenResponseModelFromJson(jsonString);

import 'dart:convert';

SearchScreenResponseModel searchScreenResponseModelFromJson(String str) => SearchScreenResponseModel.fromJson(json.decode(str));

String searchScreenResponseModelToJson(SearchScreenResponseModel data) => json.encode(data.toJson());

class SearchScreenResponseModel {
  List<SearchDatum> searchData;

  SearchScreenResponseModel({
    required this.searchData,
  });

  factory SearchScreenResponseModel.fromJson(Map<String, dynamic> json) => SearchScreenResponseModel(
    searchData: List<SearchDatum>.from(json["searchData"].map((x) => SearchDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "searchData": List<dynamic>.from(searchData.map((x) => x.toJson())),
  };
}

class SearchDatum {
  dynamic photourl;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic searchDatumCreatedAt;
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
  dynamic deletedAt;
  List<Attribute> attributes;
  List<dynamic> goals;
  dynamic reason;

  SearchDatum({
     this.photourl,
     this.createdAt,
     this.updatedAt,
     this.id,
     this.searchDatumCreatedAt,
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
     this.deletedAt,
    required this.attributes,
    required this.goals,
     this.reason,
  });

  factory SearchDatum.fromJson(Map<String, dynamic> json) => SearchDatum(
    photourl: json["photourl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    searchDatumCreatedAt: json["created_at"],
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
    goals: List<dynamic>.from(json["goals"].map((x) => x)),
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "photourl": photourl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": searchDatumCreatedAt,
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
    "goals": List<dynamic>.from(goals.map((x) => x)),
    "reason": reason,
  };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<String> attributes;

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
