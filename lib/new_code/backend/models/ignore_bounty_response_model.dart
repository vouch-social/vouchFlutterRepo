// To parse this JSON data, do
//
//     final ignoreBountyModel = ignoreBountyModelFromJson(jsonString);

import 'dart:convert';

IgnoreBountyModel ignoreBountyModelFromJson(String str) => IgnoreBountyModel.fromJson(json.decode(str));

String ignoreBountyModelToJson(IgnoreBountyModel data) => json.encode(data.toJson());

class IgnoreBountyModel {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic ignoreBountyModelCreatedAt;
  dynamic bountyId;
  dynamic userId;
  dynamic hunterStatus;
  dynamic claimMessage;

  IgnoreBountyModel({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.ignoreBountyModelCreatedAt,
     this.bountyId,
     this.userId,
     this.hunterStatus,
     this.claimMessage,
  });

  factory IgnoreBountyModel.fromJson(Map<String, dynamic> json) => IgnoreBountyModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    ignoreBountyModelCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
    claimMessage: json["claim_message"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": ignoreBountyModelCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status": hunterStatus,
    "claim_message": claimMessage,
  };
}
