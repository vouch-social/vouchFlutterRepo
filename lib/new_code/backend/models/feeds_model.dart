// To parse this JSON data, do
//
//     final feedsModel = feedsModelFromJson(jsonString);

import 'dart:convert';

FeedsModel feedsModelFromJson(String str) => FeedsModel.fromJson(json.decode(str));

String feedsModelToJson(FeedsModel data) => json.encode(data.toJson());

class FeedsModel {
  List<Bounty> bounties;
  List<Vouch> vouches;

  FeedsModel({
    required this.bounties,
    required this.vouches,
  });

  factory FeedsModel.fromJson(Map<String, dynamic> json) => FeedsModel(
    bounties: List<Bounty>.from(json["bounties"].map((x) => Bounty.fromJson(x))),
    vouches: List<Vouch>.from(json["vouches"].map((x) => Vouch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bounties": List<dynamic>.from(bounties.map((x) => x.toJson())),
    "vouches": List<dynamic>.from(vouches.map((x) => x.toJson())),
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
    user: User.fromJson(json["user"]),
    hunters: json["hunters"] != null ? List<Hunter>.from(json["hunters"].map((x) => Hunter.fromJson(x))) : [],  );

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

class Vouch {
  String createdAt;
  String updatedAt;
  int id;
  String vouchCreatedAt;
  String message;
  String status;
  int pathlength;
  String startnode;
  String endnode;
  String activenode;
  String activenodeStatus;
  int userId;
  PathData pathData;

  Vouch({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.vouchCreatedAt,
    required this.message,
    required this.status,
    required this.pathlength,
    required this.startnode,
    required this.endnode,
    required this.activenode,
    required this.activenodeStatus,
    required this.userId,
    required this.pathData,
  });

  factory Vouch.fromJson(Map<String, dynamic> json) => Vouch(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    vouchCreatedAt: json["created_at"],
    message: json["message"],
    status: json["status"],
    pathlength: json["pathlength"],
    startnode: json["startnode"],
    endnode: json["endnode"],
    activenode: json["activenode"],
    activenodeStatus: json["activenode_status"],
    userId: json["user_id"],
    pathData: PathData.fromJson(json["path_data"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "created_at": vouchCreatedAt,
    "message": message,
    "status": status,
    "pathlength": pathlength,
    "startnode": startnode,
    "endnode": endnode,
    "activenode": activenode,
    "activenode_status": activenodeStatus,
    "user_id": userId,
    "path_data": pathData.toJson(),
  };
}

class PathData {
  List<Path> path;
  int length;
  int strength;

  PathData({
    required this.path,
    required this.length,
    required this.strength,
  });

  factory PathData.fromJson(Map<String, dynamic> json) => PathData(
    path: List<Path>.from(json["path"].map((x) => Path.fromJson(x))),
    length: json["length"],
    strength: json["strength"],
  );

  Map<String, dynamic> toJson() => {
    "path": List<dynamic>.from(path.map((x) => x.toJson())),
    "length": length,
    "strength": strength,
  };
}

class Path {
  String name;
  String? image;
  String heading;
  List<Attribute> attributes;
  bool hasVouched;
  bool isRegistered;
  double strengthToNext;
  String contactHashedPhone;

  Path({
    required this.name,
    required this.image,
    required this.heading,
    required this.attributes,
    required this.hasVouched,
    required this.isRegistered,
    required this.strengthToNext,
    required this.contactHashedPhone,
  });

  factory Path.fromJson(Map<String, dynamic> json) => Path(
    name: json["name"],
    image: json["image"],
    heading: json["heading"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    hasVouched: json["hasVouched"],
    isRegistered: json["isRegistered"],
    strengthToNext: json["strengthToNext"]?.toDouble(),
    contactHashedPhone: json["contactHashedPhone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "heading": heading,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "hasVouched": hasVouched,
    "isRegistered": isRegistered,
    "strengthToNext": strengthToNext,
    "contactHashedPhone": contactHashedPhone,
  };
}

class Attribute {
  int id;
  dynamic userId;
  String createdAt;
  String updatedAt;
  List<String> attributes;

  Attribute({
    required this.id,
     this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.attributes,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    userId: json["userId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    attributes: List<String>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}
