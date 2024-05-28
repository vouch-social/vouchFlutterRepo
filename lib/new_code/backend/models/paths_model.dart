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
     this.numPaths,
     this.finalPaths,
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
  dynamic length;
  dynamic strength;

  SinglePath({
    required this.pathNode,
     this.length,
     this.strength,
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
  dynamic strengthToNext;
  dynamic isRegistered;
  dynamic status;
  dynamic heading;
  dynamic image;
  List<Attribute> attributes;

  PathNode({
    this.name,
    this.contactHashedPhone,
     this.strengthToNext,
     this.isRegistered,
     this.heading,
    this.status,
     this.image,
    required this.attributes,
  });

  factory PathNode.fromJson(Map<String, dynamic> json) => PathNode(
        name: json["name"],
        contactHashedPhone: json["contactHashedPhone"],
        strengthToNext: json["strengthToNext"]?.toDouble(),
        isRegistered: json["isRegistered"] ?? false,
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
