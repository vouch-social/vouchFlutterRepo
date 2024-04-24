// To parse this JSON data, do
//
//     final pathsModel = pathsModelFromJson(jsonString);

import 'dart:convert';

PathsModel pathsModelFromJson(String str) =>
    PathsModel.fromJson(json.decode(str));

String pathsModelToJson(PathsModel data) => json.encode(data.toJson());

class PathsModel {
  Data data;

  PathsModel({
    required this.data,
  });

  factory PathsModel.fromJson(Map<String, dynamic> json) => PathsModel(
        data: Data.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<DataPath> paths;
  int numPaths;
  int finalPaths;

  Data({
    required this.paths,
    required this.numPaths,
    required this.finalPaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paths:
            List<DataPath>.from(json["paths"].map((x) => DataPath.fromJson(x))),
        numPaths: json["numPaths"],
        finalPaths: json["finalPaths"],
      );

  Map<String, dynamic> toJson() => {
        "paths": List<dynamic>.from(paths.map((x) => x.toJson())),
        "numPaths": numPaths,
        "finalPaths": finalPaths,
      };
}

class DataPath {
  List<PathPath> path;
  int length;
  double strength;

  DataPath({
    required this.path,
    required this.length,
    required this.strength,
  });

  factory DataPath.fromJson(Map<String, dynamic> json) => DataPath(
        path:
            List<PathPath>.from(json["path"].map((x) => PathPath.fromJson(x))),
        length: json["length"],
        strength: json["strength"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "path": List<dynamic>.from(path.map((x) => x.toJson())),
        "length": length,
        "strength": strength,
      };
}

class PathPath {
  dynamic name;
  dynamic contactHashedPhone;
  double strengthToNext;
  bool isRegistered;
  dynamic heading;
  dynamic image = 'https://media.licdn.com/dms/image/C5603AQEFnqHFu0ougw/profile-displayphoto-shrink_100_100/0/1517460846161?e=1715212800&v=beta&t=3d7rHcIDt_64AW55zFyWNnBhdeN_YtMMVuSE-qbRmVA';
  List<Attribute> attributes;

  PathPath({
    this.name,
    this.contactHashedPhone,
    required this.strengthToNext,
    required this.isRegistered,
    required this.heading,
    required this.image,
    required this.attributes,
  });

  factory PathPath.fromJson(Map<String, dynamic> json) => PathPath(
        name: json["name"],
        contactHashedPhone: json["contactHashedPhone"],
        strengthToNext: json["strengthToNext"]?.toDouble(),
        isRegistered: json["isRegistered"],
        heading: json["heading"],
        image: json["image"],
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
