// To parse this JSON data, do
//
//     final startHuntModel = startHuntModelFromJson(jsonString);

import 'dart:convert';

StartHuntModel startHuntModelFromJson(String str) => StartHuntModel.fromJson(json.decode(str));

String startHuntModelToJson(StartHuntModel data) => json.encode(data.toJson());

class StartHuntModel {
  String createdAt;
  String updatedAt;
  int id;
  String startHuntModelCreatedAt;
  int bountyId;
  int userId;

  StartHuntModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.startHuntModelCreatedAt,
    required this.bountyId,
    required this.userId,
  });

  factory StartHuntModel.fromJson(Map<String, dynamic> json) => StartHuntModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    startHuntModelCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": startHuntModelCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
  };
}
