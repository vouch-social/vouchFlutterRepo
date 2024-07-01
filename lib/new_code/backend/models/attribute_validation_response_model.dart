// To parse this JSON data, do
//
//     final attributesValidationResponseModel = attributesValidationResponseModelFromJson(jsonString);

import 'dart:convert';

AttributesValidationResponseModel attributesValidationResponseModelFromJson(String str) => AttributesValidationResponseModel.fromJson(json.decode(str));

String attributesValidationResponseModelToJson(AttributesValidationResponseModel data) => json.encode(data.toJson());

class AttributesValidationResponseModel {
  ResponseData responseData;

  AttributesValidationResponseModel({
    required this.responseData,
  });

  factory AttributesValidationResponseModel.fromJson(Map<String, dynamic> json) => AttributesValidationResponseModel(
    responseData: ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  String createdAt;
  String updatedAt;
  int id;
  bool status;
  int attributeId;
  String attributeName;
  int userId;
  int attributeOwner;
  DateTime whenToAskValidation;
  String strength;
  Attribute attribute;

  ResponseData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.status,
    required this.attributeId,
    required this.attributeName,
    required this.userId,
    required this.attributeOwner,
    required this.whenToAskValidation,
    required this.strength,
    required this.attribute,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
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
    attribute: Attribute.fromJson(json["attribute"]),
  );

  Map<String, dynamic> toJson() => {
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
    "attribute": attribute.toJson(),
  };
}

class Attribute {
  String createdAt;
  String updatedAt;
  int id;
  int userId;
  String attribute;
  double score;

  Attribute({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.attribute,
    required this.score,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    attribute: json["attribute"],
    score: json["score"]?.toDouble(),
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
