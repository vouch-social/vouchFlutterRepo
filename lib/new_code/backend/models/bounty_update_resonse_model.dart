// To parse this JSON data, do
//
//     final bountyUpdateModel = bountyUpdateModelFromJson(jsonString);

import 'dart:convert';

BountyUpdateModel bountyUpdateModelFromJson(String str) => BountyUpdateModel.fromJson(json.decode(str));

String bountyUpdateModelToJson(BountyUpdateModel data) => json.encode(data.toJson());

class BountyUpdateModel {
  String createdAt;
  String updatedAt;
  int id;
  String bountyUpdateModelCreatedAt;
  int bountyId;
  int userId;
  String hunterStatus;

  BountyUpdateModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.bountyUpdateModelCreatedAt,
    required this.bountyId,
    required this.userId,
    required this.hunterStatus,
  });

  factory BountyUpdateModel.fromJson(Map<String, dynamic> json) => BountyUpdateModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    bountyUpdateModelCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": bountyUpdateModelCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status": hunterStatus,
  };
}
