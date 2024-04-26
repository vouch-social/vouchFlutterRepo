// To parse this JSON data, do
//
//     final sendPathrRsponseModel = sendPathrRsponseModelFromJson(jsonString);

import 'dart:convert';

SendPathResponseModel sendPatResponseModelFromJson(String str) => SendPathResponseModel.fromJson(json.decode(str));

String sendPathResponseModelToJson(SendPathResponseModel data) => json.encode(data.toJson());

class SendPathResponseModel {
  Data data;

  SendPathResponseModel({
    required this.data,
  });

  factory SendPathResponseModel.fromJson(Map<String, dynamic> json) => SendPathResponseModel(
    data: Data.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  dynamic sharableMessage;

  Data({
    required this.sharableMessage,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    sharableMessage: json["sharableMessage"],
  );

  Map<String, dynamic> toJson() => {
    "sharableMessage": sharableMessage,
  };
}