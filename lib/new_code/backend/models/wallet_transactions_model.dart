// To parse this JSON data, do
//
//     final walletTransactionsModel = walletTransactionsModelFromJson(jsonString);

import 'dart:convert';

WalletTransactionsModel walletTransactionsModelFromJson(String str) => WalletTransactionsModel.fromJson(json.decode(str));

String walletTransactionsModelToJson(WalletTransactionsModel data) => json.encode(data.toJson());

class WalletTransactionsModel {
  List<ResponseDatum> responseData;

  WalletTransactionsModel({
    required this.responseData,
  });

  factory WalletTransactionsModel.fromJson(Map<String, dynamic> json) => WalletTransactionsModel(
    responseData: List<ResponseDatum>.from(json["responseData"].map((x) => ResponseDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
  };
}

class ResponseDatum {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  dynamic walletId;
  dynamic amount;
  dynamic transactionType;
  dynamic openingBalance;
  dynamic closingBalance;
  dynamic description;

  ResponseDatum({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.walletId,
    required this.amount,
    required this.transactionType,
    required this.openingBalance,
    required this.closingBalance,
    required this.description,
  });

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    walletId: json["wallet_id"],
    amount: json["amount"],
    transactionType: json["transaction_type"],
    openingBalance: json["opening_balance"],
    closingBalance: json["closing_balance"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "wallet_id": walletId,
    "amount": amount,
    "transaction_type": transactionType,
    "opening_balance": openingBalance,
    "closing_balance": closingBalance,
    "description": description,
  };
}
