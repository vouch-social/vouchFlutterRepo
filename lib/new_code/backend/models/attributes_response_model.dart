import 'dart:convert';

AttributesResponseModel attributesResponseModelFromJson(String str) => AttributesResponseModel.fromJson(json.decode(str));

String attributesResponseModelToJson(AttributesResponseModel data) => json.encode(data.toJson());

class AttributesResponseModel {
  List<String> attributes;

  AttributesResponseModel({
    required this.attributes,
  });

  factory AttributesResponseModel.fromJson(Map<String, dynamic> json) => AttributesResponseModel(
    attributes: List<String>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}