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
  List<Hunter> hunters;
  Urgency urgency;
  User user;

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
    required this.user,
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
    hunters: List<Hunter>.from(json["hunters"].map((x) => Hunter.fromJson(x))),
    urgency: Urgency.fromJson(json["urgency"]),
    user: User.fromJson(json["user"]),
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
    "user": user.toJson(),
  };
}

class Hunter {
  String createdAt;
  String updatedAt;
  int id;
  String hunterCreatedAt;
  int bountyId;
  int userId;
  User user;
  String hunterStatus;

  Hunter({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.hunterCreatedAt,
    required this.bountyId,
    required this.userId,
    required this.user,
    required this.hunterStatus,
  });

  factory Hunter.fromJson(Map<String, dynamic> json) => Hunter(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    hunterCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
    user: json["user"] == null ? User(name: "Name",photourl: null,localizedheadline: "HeadLine") :User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": hunterCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status":hunterStatus,
    "user": user.toJson(),
  };
}

class User {
  String name;
  dynamic photourl;
  String localizedheadline;

  User({
    required this.name,
    this.photourl,
    required this.localizedheadline,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    photourl: json["photourl"],
    localizedheadline: json["localizedheadline"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photourl": photourl,
    "localizedheadline": localizedheadline,
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
