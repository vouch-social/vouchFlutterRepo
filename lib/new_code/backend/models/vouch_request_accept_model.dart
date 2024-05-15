import 'dart:convert';

VouchAcceptModel vouchAcceptModelFromJson(String str) => VouchAcceptModel.fromJson(json.decode(str));

String vouchAcceptModelToJson(VouchAcceptModel data) => json.encode(data.toJson());

class VouchAcceptModel {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic vouchAcceptModelCreatedAt;
  dynamic message;
  dynamic status;
  dynamic pathlength;
  dynamic startnode;
  dynamic endnode;
  dynamic activenode;
  dynamic activenodeStatus;
  dynamic userId;
  PathData pathData;

  VouchAcceptModel({
     this.createdAt,
     this.updatedAt,
     this.id,
     this.vouchAcceptModelCreatedAt,
     this.message,
     this.status,
     this.pathlength,
     this.startnode,
     this.endnode,
     this.activenode,
     this.activenodeStatus,
     this.userId,
    required this.pathData,
  });

  factory VouchAcceptModel.fromJson(Map<String, dynamic> json) => VouchAcceptModel(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    vouchAcceptModelCreatedAt: json["created_at"],
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
    "created_at": vouchAcceptModelCreatedAt,
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
  dynamic length;
  dynamic strength;

  PathData({
    required this.path,
     this.length,
     this.strength,
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
  dynamic name;
  dynamic image;
  dynamic heading;
  List<Attribute> attributes;
  dynamic isRegistered;
  dynamic strengthToNext;
  dynamic contactHashedPhone;
  dynamic hasVouched;

  Path({
     this.name,
     this.image,
     this.heading,
    required this.attributes,
     this.isRegistered,
     this.strengthToNext,
     this.contactHashedPhone,
     this.hasVouched,
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
  dynamic id;
  dynamic userId;
  dynamic createdAt;
  dynamic updatedAt;
  List<dynamic> attributes;

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
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}