// To parse this JSON data, do
//
//     final getWalletModel = getWalletModelFromJson(jsonString);

import 'dart:convert';

GetWalletModel getWalletModelFromJson(String str) => GetWalletModel.fromJson(json.decode(str));

String getWalletModelToJson(GetWalletModel data) => json.encode(data.toJson());

class GetWalletModel {
  ResponseData responseData;

  GetWalletModel({
    required this.responseData,
  });

  factory GetWalletModel.fromJson(Map<String, dynamic> json) => GetWalletModel(
    responseData: ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  String createdAt;
  String updatedAt;
  int id;
  int userId;
  int balance;

  ResponseData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.balance,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "balance": balance,
  };
}
