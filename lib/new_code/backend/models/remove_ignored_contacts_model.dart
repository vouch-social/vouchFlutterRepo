import 'dart:convert';

RemoveIgnoreListModel removeIgnoreListModelFromJson(String str) => RemoveIgnoreListModel.fromJson(json.decode(str));

String removeIgnoreListModelToJson(RemoveIgnoreListModel data) => json.encode(data.toJson());

class RemoveIgnoreListModel {
  IgnoreRemovedContacts ignoreRemovedContacts;

  RemoveIgnoreListModel({
    required this.ignoreRemovedContacts,
  });

  factory RemoveIgnoreListModel.fromJson(Map<String, dynamic> json) => RemoveIgnoreListModel(
    ignoreRemovedContacts: IgnoreRemovedContacts.fromJson(json["ignoreRemovedContacts"]),
  );

  Map<String, dynamic> toJson() => {
    "ignoreRemovedContacts": ignoreRemovedContacts.toJson(),
  };
}

class IgnoreRemovedContacts {
  String hashedPhone;
  List<ContactList> contactList;

  IgnoreRemovedContacts({
    required this.hashedPhone,
    required this.contactList,
  });

  factory IgnoreRemovedContacts.fromJson(Map<String, dynamic> json) => IgnoreRemovedContacts(
    hashedPhone: json["hashedPhone"],
    contactList: List<ContactList>.from(json["contactList"].map((x) => ContactList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hashedPhone": hashedPhone,
    "contactList": List<dynamic>.from(contactList.map((x) => x.toJson())),
  };
}

class ContactList {
  String hashedPhone;
  String contactName;

  ContactList({
    required this.hashedPhone,
    required this.contactName,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
    hashedPhone: json["hashedPhone"],
    contactName: json["contactName"],
  );

  Map<String, dynamic> toJson() => {
    "hashedPhone": hashedPhone,
    "contactName": contactName,
  };
}
