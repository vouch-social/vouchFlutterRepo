// To parse this JSON data, do
//
//     final attributesValidationModel = attributesValidationModelFromJson(jsondynamic);

import 'dart:convert';

AttributesValidationModel attributesValidationModelFromJson(dynamic str) => AttributesValidationModel.fromJson(json.decode(str));

dynamic attributesValidationModelToJson(AttributesValidationModel data) => json.encode(data.toJson());

class AttributesValidationModel {
  List<ResponseDatum> responseData;

  AttributesValidationModel({
    required this.responseData,
  });

  factory AttributesValidationModel.fromJson(Map<dynamic, dynamic> json) => AttributesValidationModel(
    responseData: List<ResponseDatum>.from(json["responseData"].map((x) => ResponseDatum.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
  };
}

class ResponseDatum {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  bool status;
  dynamic attributeId;
  dynamic attributeName;
  dynamic userId;
  dynamic attributeOwner;
  DateTime whenToAskValidation;
  dynamic strength;
  User user;
  Attribute attribute;

  ResponseDatum({
     this.createdAt,
     this.updatedAt,
     this.id,
    required this.status,
     this.attributeId,
     this.attributeName,
     this.userId,
     this.attributeOwner,
    required this.whenToAskValidation,
     this.strength,
    required this.user,
    required this.attribute,
  });

  factory ResponseDatum.fromJson(Map<dynamic, dynamic> json) => ResponseDatum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    status: json["status"],
    attributeId: json["attribute_id"],
    attributeName: json["attribute_name"],
    userId: json["user_id"],
    attributeOwner: json["attribute_owner"],
    whenToAskValidation: DateTime.parse(json["when_to_ask_validation"]),
    strength: json["strength"],
    user: User.fromJson(json["user"]),
    attribute: Attribute.fromJson(json["attribute"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "status": status,
    "attribute_id": attributeId,
    "attribute_name": attributeName,
    "user_id": userId,
    "attribute_owner": attributeOwner,
    "when_to_ask_validation": "${whenToAskValidation.year.toString().padLeft(4, '0')}-${whenToAskValidation.month.toString().padLeft(2, '0')}-${whenToAskValidation.day.toString().padLeft(2, '0')}",
    "strength": strength,
    "user": user.toJson(),
    "attribute": attribute.toJson(),
  };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  dynamic attribute;
  dynamic score;

  Attribute({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.userId,
     this.attribute,
     this.score,
  });

  factory Attribute.fromJson(Map<dynamic, dynamic> json) => Attribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attribute: json["attribute"],
    score: json["score"],
  );

  Map<dynamic, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "attribute": attribute,
    "score": score,
  };
}

class User {
  dynamic name;
  dynamic id;
  dynamic photourl;

  User({
     this.name,
     this.id,
    this.photourl,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
    name: json["name"],
    id: json["id"],
      photourl: json["photourl"]
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "id": id,
    "photourl":photourl
  };
}
