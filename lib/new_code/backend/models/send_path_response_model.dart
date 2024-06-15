// To parse this JSON data, do
//
//     final sendPathResponseModel = sendPathResponseModelFromJson(jsonString);

import 'dart:convert';

SendPathResponseModel sendPathResponseModelFromJson(String str) => SendPathResponseModel.fromJson(json.decode(str));

String sendPathResponseModelToJson(SendPathResponseModel data) => json.encode(data.toJson());

class SendPathResponseModel {
  dynamic sharableMessage;
  bool existingPath;
  dynamic vouchId;

  SendPathResponseModel({
     this.sharableMessage,
    required this.existingPath,
     this.vouchId,
  });

  factory SendPathResponseModel.fromJson(Map<String, dynamic> json) => SendPathResponseModel(
    sharableMessage: json["sharableMessage"],
    existingPath: json["existingPath"],
    vouchId: json["vouchId"],
  );

  Map<String, dynamic> toJson() => {
    "sharableMessage": sharableMessage,
    "existingPath": existingPath,
    "vouchId": vouchId,
  };
}
