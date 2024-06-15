// To parse this JSON data, do
//
//     final bountyUpdateModel = bountyUpdateModelFromJson(jsonString);

import 'dart:convert';

BountyUpdateModel bountyUpdateModelFromJson(String str) => BountyUpdateModel.fromJson(json.decode(str));

String bountyUpdateModelToJson(BountyUpdateModel data) => json.encode(data.toJson());

class BountyUpdateModel {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic bountyUpdateModelCreatedAt;
  dynamic bountyId;
  dynamic userId;
  dynamic hunterStatus;
  dynamic claimMessage;

  BountyUpdateModel({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.bountyUpdateModelCreatedAt,
     this.bountyId,
     this.userId,
     this.hunterStatus,
     this.claimMessage,
  });

  factory BountyUpdateModel.fromJson(Map<String, dynamic> json) => BountyUpdateModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    bountyUpdateModelCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
    claimMessage: json["claim_message"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": bountyUpdateModelCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status": hunterStatus,
    "claim_message": claimMessage,
  };
}
