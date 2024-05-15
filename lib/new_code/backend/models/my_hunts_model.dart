// To parse this JSON data, do
//
//     final myHuntsModel = myHuntsModelFromJson(jsonString);

import 'dart:convert';

MyHuntsModel myHuntsModelFromJson(String str) => MyHuntsModel.fromJson(json.decode(str));

String myHuntsModelToJson(MyHuntsModel data) => json.encode(data.toJson());

class MyHuntsModel {
  List<MyHunt> myHunts;

  MyHuntsModel({
    required this.myHunts,
  });

  factory MyHuntsModel.fromJson(Map<String, dynamic> json) => MyHuntsModel(
    myHunts: List<MyHunt>.from(json["myHunts"].map((x) => MyHunt.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myHunts": List<dynamic>.from(myHunts.map((x) => x.toJson())),
  };
}

class MyHunt {
  String createdAt;
  String updatedAt;
  int id;
  String myHuntCreatedAt;
  int bountyId;
  int userId;
  String hunterStatus;
  Bounty bounty;
  User user;

  MyHunt({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.myHuntCreatedAt,
    required this.bountyId,
    required this.userId,
    required this.hunterStatus,
    required this.bounty,
    required this.user,
  });

  factory MyHunt.fromJson(Map<String, dynamic> json) => MyHunt(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    myHuntCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
    bounty: Bounty.fromJson(json["bounty"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": myHuntCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status": hunterStatus,
    "bounty": bounty.toJson(),
    "user": user.toJson(),
  };
}

class Bounty {
  int id;
  int userId;
  String message;
  List<String> tags;
  int urgencyId;
  int expiry;
  String bountyStatus;
  DateTime createdAt;
  DateTime updatedAt;
  Urgency urgency;
  User user;
  List<Hunter> hunters;

  Bounty({
    required this.id,
    required this.userId,
    required this.message,
    required this.tags,
    required this.urgencyId,
    required this.expiry,
    required this.bountyStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.urgency,
    required this.user,
    required this.hunters,
  });

  factory Bounty.fromJson(Map<String, dynamic> json) => Bounty(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    urgencyId: json["urgency_id"],
    expiry: json["expiry"],
    bountyStatus: json["bounty_status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    urgency: Urgency.fromJson(json["urgency"]),
    user: User.fromJson(json["user"]),
    hunters: List<Hunter>.from(json["hunters"].map((x) => Hunter.fromJson(x))),
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
    "urgency": urgency.toJson(),
    "user": user.toJson(),
    "hunters": List<dynamic>.from(hunters.map((x) => x.toJson())),
  };
}

class Hunter {
  String createdAt;
  String updatedAt;
  int id;
  String hunterCreatedAt;
  int bountyId;
  int userId;
  String hunterStatus;
  User user;

  Hunter({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.hunterCreatedAt,
    required this.bountyId,
    required this.userId,
    required this.hunterStatus,
    required this.user,
  });

  factory Hunter.fromJson(Map<String, dynamic> json) => Hunter(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    hunterCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    hunterStatus: json["hunter_status"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": hunterCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "hunter_status": hunterStatus,
    "user": user.toJson(),
  };
}

class User {
  String name;
  String? photourl;
  String localizedheadline;

  User({
    required this.name,
    required this.photourl,
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
