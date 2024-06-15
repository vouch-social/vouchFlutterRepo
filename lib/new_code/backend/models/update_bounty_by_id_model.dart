// To parse this JSON data, do
//
//     final updateBountyByIdModel = updateBountyByIdModelFromJson(jsonString);

import 'dart:convert';

UpdateBountyByIdModel updateBountyByIdModelFromJson(String str) => UpdateBountyByIdModel.fromJson(json.decode(str));

String updateBountyByIdModelToJson(UpdateBountyByIdModel data) => json.encode(data.toJson());

class UpdateBountyByIdModel {
  int id;
  int userId;
  String message;
  List<String> tags;
  int urgencyId;
  int expiry;
  String bountyStatus;
  DateTime createdAt;
  DateTime updatedAt;

  UpdateBountyByIdModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.tags,
    required this.urgencyId,
    required this.expiry,
    required this.bountyStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpdateBountyByIdModel.fromJson(Map<String, dynamic> json) => UpdateBountyByIdModel(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    urgencyId: json["urgency_id"],
    expiry: json["expiry"],
    bountyStatus: json["bounty_status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "message": message,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "urgency_id": urgencyId,
    "expiry": expiry,
    "bounty_status": bountyStatus,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
