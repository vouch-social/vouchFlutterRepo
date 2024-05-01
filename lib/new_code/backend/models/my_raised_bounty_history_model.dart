import 'dart:convert';

MyBountyHistoryModel myBountyHistoryModelFromJson(String str) => MyBountyHistoryModel.fromJson(json.decode(str));

String myBountyHistoryModelToJson(MyBountyHistoryModel data) => json.encode(data.toJson());

class MyBountyHistoryModel {
  List<MyBountyListDatum> myBountyListData;

  MyBountyHistoryModel({
    required this.myBountyListData,
  });

  factory MyBountyHistoryModel.fromJson(Map<String, dynamic> json) => MyBountyHistoryModel(
    myBountyListData: List<MyBountyListDatum>.from(json["myBountyListData"].map((x) => MyBountyListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myBountyListData": List<dynamic>.from(myBountyListData.map((x) => x.toJson())),
  };
}

class MyBountyListDatum {
  int id;
  int userId;
  String message;
  List<String> tags;
  int urgencyId;
  int expiry;
  DateTime createdAt;
  DateTime updatedAt;
  List<Hunter> hunters;
  Urgency urgency;

  MyBountyListDatum({
    required this.id,
    required this.userId,
    required this.message,
    required this.tags,
    required this.urgencyId,
    required this.expiry,
    required this.createdAt,
    required this.updatedAt,
    required this.hunters,
    required this.urgency,
  });

  factory MyBountyListDatum.fromJson(Map<String, dynamic> json) => MyBountyListDatum(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    urgencyId: json["urgency_id"],
    expiry: json["expiry"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    hunters: List<Hunter>.from(json["hunters"].map((x) => Hunter.fromJson(x))),
    urgency: Urgency.fromJson(json["urgency"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "message": message,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "urgency_id": urgencyId,
    "expiry": expiry,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "hunters": List<dynamic>.from(hunters.map((x) => x.toJson())),
    "urgency": urgency.toJson(),
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

  Hunter({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.hunterCreatedAt,
    required this.bountyId,
    required this.userId,
    required this.user,
  });

  factory Hunter.fromJson(Map<String, dynamic> json) => Hunter(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    hunterCreatedAt: json["created_at"],
    bountyId: json["bounty_id"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": hunterCreatedAt,
    "bounty_id": bountyId,
    "user_id": userId,
    "user": user.toJson(),
  };
}

class User {
  String name;
  String photourl;
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
