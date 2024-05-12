// To parse this JSON data, do
//
//     final myVouchHistoryModel = myVouchHistoryModelFromJson(jsonString);

import 'dart:convert';

MyVouchHistoryModel myVouchHistoryModelFromJson(String str) => MyVouchHistoryModel.fromJson(json.decode(str));

String myVouchHistoryModelToJson(MyVouchHistoryModel data) => json.encode(data.toJson());

class MyVouchHistoryModel {
  List<MySelectedPathListDatum> mySelectedPathListData;

  MyVouchHistoryModel({
    required this.mySelectedPathListData,
  });

  factory MyVouchHistoryModel.fromJson(Map<String, dynamic> json) => MyVouchHistoryModel(
    mySelectedPathListData: List<MySelectedPathListDatum>.from(json["mySelectedPathListData"].map((x) => MySelectedPathListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mySelectedPathListData": List<dynamic>.from(mySelectedPathListData.map((x) => x.toJson())),
  };
}

class MySelectedPathListDatum {
  String createdAt;
  String updatedAt;
  int id;
  String mySelectedPathListDatumCreatedAt;
  String message;
  String status;
  int pathlength;
  String startnode;
  String endnode;
  dynamic activenode;
  dynamic activenodeStatus;
  int userId;
  PathData pathData;

  MySelectedPathListDatum({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.mySelectedPathListDatumCreatedAt,
    required this.message,
    required this.status,
    required this.pathlength,
    required this.startnode,
    required this.endnode,
     this.activenode,
     this.activenodeStatus,
    required this.userId,
    required this.pathData,
  });

  factory MySelectedPathListDatum.fromJson(Map<String, dynamic> json) => MySelectedPathListDatum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    mySelectedPathListDatumCreatedAt: json["created_at"],
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
    "created_at": mySelectedPathListDatumCreatedAt,
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
  dynamic strength;

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
  bool isRegistered;
  double strengthToNext;
  String contactHashedPhone;
  bool hasVouched;

  Path({
    required this.name,
    required this.image,
    required this.heading,
    required this.attributes,
    required this.isRegistered,
    required this.strengthToNext,
    required this.contactHashedPhone,
    required this.hasVouched,
  });

  factory Path.fromJson(Map<String, dynamic> json) => Path(
    name: json["name"],
    image: json["image"],
    heading: json["heading"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    isRegistered: json["isRegistered"],
    strengthToNext: json["strengthToNext"]?.toDouble(),
    contactHashedPhone: json["contactHashedPhone"],
    hasVouched: json["hasVouched"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "heading": heading,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "isRegistered": isRegistered,
    "strengthToNext": strengthToNext,
    "contactHashedPhone": contactHashedPhone,
    "hasVouched": hasVouched,
  };
}

class Attribute {
  int id;
  int userId;
  String createdAt;
  String updatedAt;
  List<String> attributes;

  Attribute({
    required this.id,
    required this.userId,
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
