// To parse this JSON data, do
//
//     final getBountyByIdModel = getBountyByIdModelFromJson(jsonString);

import 'dart:convert';

GetBountyByIdModel getBountyByIdModelFromJson(String str) => GetBountyByIdModel.fromJson(json.decode(str));

String getBountyByIdModelToJson(GetBountyByIdModel data) => json.encode(data.toJson());

class GetBountyByIdModel {
  int id;
  int userId;
  String message;
  List<String> tags;
  int urgencyId;
  int expiry;
  String bountyStatus;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> hunters;
  Urgency urgency;

  GetBountyByIdModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.tags,
    required this.urgencyId,
    required this.expiry,
    required this.bountyStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.hunters,
    required this.urgency,
  });

  factory GetBountyByIdModel.fromJson(Map<String, dynamic> json) => GetBountyByIdModel(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    urgencyId: json["urgency_id"],
    expiry: json["expiry"],
    bountyStatus: json["bounty_status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    hunters: List<dynamic>.from(json["hunters"].map((x) => x)),
    urgency: Urgency.fromJson(json["urgency"]),
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
    "hunters": List<dynamic>.from(hunters.map((x) => x)),
    "urgency": urgency.toJson(),
  };
}

class Urgency {
  String name;

  Urgency({
    required this.name,
  });

  factory Urgency.fromJson(Map<String, dynamic> json) => Urgency(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
