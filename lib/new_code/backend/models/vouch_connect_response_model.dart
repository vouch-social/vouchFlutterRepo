// To parse this JSON data, do
//
//     final vouchConnectModel = vouchConnectModelFromJson(jsonString);

import 'dart:convert';

VouchConnectModel vouchConnectModelFromJson(String str) => VouchConnectModel.fromJson(json.decode(str));

String vouchConnectModelToJson(VouchConnectModel data) => json.encode(data.toJson());

class VouchConnectModel {
  String urlForWhatsapp;

  VouchConnectModel({
    required this.urlForWhatsapp,
  });

  factory VouchConnectModel.fromJson(Map<String, dynamic> json) => VouchConnectModel(
    urlForWhatsapp: json["urlForWhatsapp"],
  );

  Map<String, dynamic> toJson() => {
    "urlForWhatsapp": urlForWhatsapp,
  };
}
