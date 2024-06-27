// To parse this JSON data, do
//
//     final newAttributeModel = newAttributeModelFromJson(jsonString);

import 'dart:convert';

NewAttributeModel newAttributeModelFromJson(String str) => NewAttributeModel.fromJson(json.decode(str));

String newAttributeModelToJson(NewAttributeModel data) => json.encode(data.toJson());

class NewAttributeModel {
  NewAttribute newAttribute;

  NewAttributeModel({
    required this.newAttribute,
  });

  factory NewAttributeModel.fromJson(Map<String, dynamic> json) => NewAttributeModel(
    newAttribute: NewAttribute.fromJson(json["newAttribute"]),
  );

  Map<String, dynamic> toJson() => {
    "newAttribute": newAttribute.toJson(),
  };
}

class NewAttribute {
  String createdAt;
  String updatedAt;
  int score;
  int id;
  int userId;
  String attribute;

  NewAttribute({
    required this.createdAt,
    required this.updatedAt,
    required this.score,
    required this.id,
    required this.userId,
    required this.attribute,
  });

  factory NewAttribute.fromJson(Map<String, dynamic> json) => NewAttribute(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    score: json["score"],
    id: json["id"],
    userId: json["user_id"],
    attribute: json["attribute"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "score": score,
    "id": id,
    "user_id": userId,
    "attribute": attribute,
  };
}
