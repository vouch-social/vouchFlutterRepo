// To parse this JSON data, do
//
//     final pathsModel = pathsModelFromJson(jsonString);

import 'dart:convert';

AllPaths pathsModelFromJson(String str) =>
    AllPaths.fromJson(json.decode(str));

String pathsModelToJson(AllPaths data) => json.encode(data.toJson());

class AllPaths {
   List<SinglePath> singlePathList;
  dynamic numPaths;
  dynamic finalPaths;

  AllPaths({
    required this.singlePathList,
    required this.numPaths,
    required this.finalPaths,
  });

  factory AllPaths.fromJson(Map<String, dynamic> json) => AllPaths(
        singlePathList:
            List<SinglePath>.from(json["paths"].map((x) => SinglePath.fromJson(x))),
        numPaths: json["numPaths"],
        finalPaths: json["finalPaths"],
      );

  Map<String, dynamic> toJson() => {
        "paths": List<dynamic>.from(singlePathList.map((x) => x.toJson())),
        "numPaths": numPaths,
        "finalPaths": finalPaths,
      };
}

class SinglePath {
  List<PathNode> pathNode;
  int length;
  double strength;

  SinglePath({
    required this.pathNode,
    required this.length,
    required this.strength,
  });

  factory SinglePath.fromJson(Map<String, dynamic> json) => SinglePath(
        pathNode:
            List<PathNode>.from(json["path"].map((x) => PathNode.fromJson(x))),
        length: json["length"],
        strength: json["strength"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "path": List<dynamic>.from(pathNode.map((x) => x.toJson())),
        "length": length,
        "strength": strength,
      };
}

class PathNode {
  dynamic name;
  dynamic contactHashedPhone;
  double strengthToNext;
  bool isRegistered;
  dynamic status;
  dynamic heading;
  dynamic image = 'https://media.licdn.com/dms/image/C5603AQEFnqHFu0ougw/profile-displayphoto-shrink_100_100/0/1517460846161?e=1715212800&v=beta&t=3d7rHcIDt_64AW55zFyWNnBhdeN_YtMMVuSE-qbRmVA';
  List<Attribute> attributes;

  PathNode({
    this.name,
    this.contactHashedPhone,
    required this.strengthToNext,
    required this.isRegistered,
    required this.heading,
    this.status,
    required this.image,
    required this.attributes,
  });

  factory PathNode.fromJson(Map<String, dynamic> json) => PathNode(
        name: json["name"],
        contactHashedPhone: json["contactHashedPhone"],
        strengthToNext: json["strengthToNext"]?.toDouble(),
        isRegistered: json["isRegistered"],
        heading: json["heading"],
        image: json["image"],
        status: json["status"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "contactHashedPhone": contactHashedPhone,
        "strengthToNext": strengthToNext,
        "isRegistered": isRegistered,
        "heading": heading,
        "image": image,
        "status": status,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
      };
}

class Attribute {
  dynamic createdAt;
  dynamic updatedAt;
  int id;
  int userId;
  List<String> attributes;

  Attribute({
    this.createdAt,
    this.updatedAt,
    required this.id,
    required this.userId,
    required this.attributes,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        userId: json["user_id"],
        attributes: List<String>.from(json["attributes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "user_id": userId,
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
      };
}
