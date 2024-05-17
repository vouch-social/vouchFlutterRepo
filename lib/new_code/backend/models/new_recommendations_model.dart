// To parse this JSON data, do
//
//     final newRecommendationsModel = newRecommendationsModelFromJson(jsonString);

import 'dart:convert';

NewRecommendationsModel newRecommendationsModelFromJson(String str) => NewRecommendationsModel.fromJson(json.decode(str));

String newRecommendationsModelToJson(NewRecommendationsModel data) => json.encode(data.toJson());

class NewRecommendationsModel {
  List<NewUserDatum> userData;

  NewRecommendationsModel({
    required this.userData,
  });

  factory NewRecommendationsModel.fromJson(Map<String, dynamic> json) => NewRecommendationsModel(
    userData: List<NewUserDatum>.from(json["userData"].map((x) => NewUserDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userData": List<dynamic>.from(userData.map((x) => x.toJson())),
  };
}

class NewUserDatum {
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
  dynamic goal;
  List<NewAttribute> attributes;

  NewUserDatum({
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
     this.goal,
    required this.attributes,
  });

  factory NewUserDatum.fromJson(Map<String, dynamic> json) => NewUserDatum(
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
    goal: json["goal"],
    attributes: List<NewAttribute>.from(json["attributes"].map((x) => NewAttribute.fromJson(x))),
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
    "goal": goal,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
  };
}

class NewAttribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  List<dynamic> attributes;

  NewAttribute({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userId,
    required this.attributes,
  });

  factory NewAttribute.fromJson(Map<String, dynamic> json) => NewAttribute(
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
