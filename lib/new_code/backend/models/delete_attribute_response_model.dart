// To parse this JSON data, do
//
//     final deleteAttributeResponseModel = deleteAttributeResponseModelFromJson(jsonString);

import 'dart:convert';

DeleteAttributeResponseModel deleteAttributeResponseModelFromJson(String str) => DeleteAttributeResponseModel.fromJson(json.decode(str));

String deleteAttributeResponseModelToJson(DeleteAttributeResponseModel data) => json.encode(data.toJson());

class DeleteAttributeResponseModel {
  DeleteAttributeResponseModel();

  factory DeleteAttributeResponseModel.fromJson(Map<String, dynamic> json) => DeleteAttributeResponseModel(
  );

  Map<String, dynamic> toJson() => {
  };
}
