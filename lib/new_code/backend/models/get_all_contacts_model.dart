import 'dart:convert';

GetAllContactsModel getAllContactsModelFromJson(String str) => GetAllContactsModel.fromJson(json.decode(str));

String getAllContactsModelToJson(GetAllContactsModel data) => json.encode(data.toJson());

class GetAllContactsModel {
  List<ContactsList> contactsList;

  GetAllContactsModel({
    required this.contactsList,
  });

  factory GetAllContactsModel.fromJson(Map<String, dynamic> json) => GetAllContactsModel(
    contactsList: List<ContactsList>.from(json["contactsList"].map((x) => ContactsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contactsList": List<dynamic>.from(contactsList.map((x) => x.toJson())),
  };
}

class ContactsList {
  dynamic name;
  dynamic userId;
  dynamic contacthashedphone;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic status;

  ContactsList({
     this.name,
     this.userId,
    required this.contacthashedphone,
    required this.createdAt,
    required this.updatedAt,
     this.status,
  });

  factory ContactsList.fromJson(Map<String, dynamic> json) => ContactsList(
    name: json["name"],
    userId: json["user_id"],
    contacthashedphone: json["contacthashedphone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_id": userId,
    "contacthashedphone": contacthashedphone,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "status": status,
  };
}


