import 'dart:convert';

AddIgnoreListModel addIgnoreListModelFromJson(String str) => AddIgnoreListModel.fromJson(json.decode(str));

String addIgnoreListModelToJson(AddIgnoreListModel data) => json.encode(data.toJson());

class AddIgnoreListModel {
  IgnoredContacts ignoredContacts;

  AddIgnoreListModel({
    required this.ignoredContacts,
  });

  factory AddIgnoreListModel.fromJson(Map<String, dynamic> json) => AddIgnoreListModel(
    ignoredContacts: IgnoredContacts.fromJson(json["ignoredContacts"]),
  );

  Map<String, dynamic> toJson() => {
    "ignoredContacts": ignoredContacts.toJson(),
  };
}

class IgnoredContacts {
  String hashedPhone;
  List<ContactList> contactList;

  IgnoredContacts({
    required this.hashedPhone,
    required this.contactList,
  });

  factory IgnoredContacts.fromJson(Map<String, dynamic> json) => IgnoredContacts(
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

  ContactList({
    required this.hashedPhone,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
    hashedPhone: json["hashedPhone"],
  );

  Map<String, dynamic> toJson() => {
    "hashedPhone": hashedPhone,
  };
}
