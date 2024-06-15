// To parse this JSON data, do
//
//     final bountyTagsModel = bountyTagsModelFromJson(jsonString);

import 'dart:convert';

BountyTagsModel bountyTagsModelFromJson(String str) => BountyTagsModel.fromJson(json.decode(str));

String bountyTagsModelToJson(BountyTagsModel data) => json.encode(data.toJson());

class BountyTagsModel {
  List<String> bountyTagsAll;

  BountyTagsModel({
    required this.bountyTagsAll,
  });

  factory BountyTagsModel.fromJson(Map<String, dynamic> json) => BountyTagsModel(
    bountyTagsAll: List<String>.from(json["bountyTagsAll"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "bountyTagsAll": List<dynamic>.from(bountyTagsAll.map((x) => x)),
  };
}
