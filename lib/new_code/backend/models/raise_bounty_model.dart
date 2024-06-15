// To parse this JSON data, do
//
//     final raiseBountyResponseModel = raiseBountyResponseModelFromJson(jsonString);

import 'dart:convert';

RaiseBountyResponseModel raiseBountyResponseModelFromJson(String str) => RaiseBountyResponseModel.fromJson(json.decode(str));

String raiseBountyResponseModelToJson(RaiseBountyResponseModel data) => json.encode(data.toJson());

class RaiseBountyResponseModel {
  Data data;

  RaiseBountyResponseModel({
    required this.data,
  });

  factory RaiseBountyResponseModel.fromJson(Map<String, dynamic> json) => RaiseBountyResponseModel(
    data: Data.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int id;
  int userId;
  dynamic message;
  List<dynamic> tags;
  int urgencyId;
  int expiry;
  DateTime updatedAt;
  DateTime createdAt;

  Data({
    required this.id,
    required this.userId,
    required this.message,
    required this.tags,
    required this.urgencyId,
    required this.expiry,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    urgencyId: json["urgency_id"],
    expiry: json["expiry"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "message": message,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "urgency_id": urgencyId,
    "expiry": expiry,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
