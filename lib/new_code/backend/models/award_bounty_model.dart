// To parse this JSON data, do
//
//     final awardBountyModel = awardBountyModelFromJson(jsonString);

import 'dart:convert';

AwardBountyModel awardBountyModelFromJson(String str) => AwardBountyModel.fromJson(json.decode(str));

String awardBountyModelToJson(AwardBountyModel data) => json.encode(data.toJson());

class AwardBountyModel {
  RewardBountyData rewardBountyData;

  AwardBountyModel({
    required this.rewardBountyData,
  });

  factory AwardBountyModel.fromJson(Map<String, dynamic> json) => AwardBountyModel(
    rewardBountyData: RewardBountyData.fromJson(json["rewardBountyData"]),
  );

  Map<String, dynamic> toJson() => {
    "rewardBountyData": rewardBountyData.toJson(),
  };
}

class RewardBountyData {
  int id;
  int userId;
  String message;
  List<String> tags;
  int urgencyId;
  int expiry;
  String bountyStatus;
  DateTime createdAt;
  DateTime updatedAt;

  RewardBountyData({
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

  factory RewardBountyData.fromJson(Map<String, dynamic> json) => RewardBountyData(
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
