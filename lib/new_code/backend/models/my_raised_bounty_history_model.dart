import 'dart:convert';

MyBountyHistoryModel myBountyHistoryModelFromJson(String str) =>
    MyBountyHistoryModel.fromJson(json.decode(str));

String myBountyHistoryModelToJson(MyBountyHistoryModel data) =>
    json.encode(data.toJson());

class MyBountyHistoryModel {
  Data data;

  MyBountyHistoryModel({
    required this.data,
  });

  factory MyBountyHistoryModel.fromJson(Map<String, dynamic> json) =>
      MyBountyHistoryModel(
        data: Data.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<SingleBountyData> myBountyListData;

  Data({
    required this.myBountyListData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        myBountyListData: List<SingleBountyData>.from(
            json["myBountyListData"].map((x) => SingleBountyData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "myBountyListData":
            List<dynamic>.from(myBountyListData.map((x) => x.toJson())),
      };
}

class SingleBountyData {
  dynamic id;
  dynamic userId;
  dynamic message;
  List<dynamic> tags;
  dynamic urgencyId;
  dynamic expiry;
  dynamic createdAt;
  dynamic updatedAt;

  SingleBountyData({
    this.id,
    this.userId,
    this.message,
    required this.tags,
    this.urgencyId,
    this.expiry,
    this.createdAt,
    this.updatedAt,
  });

  factory SingleBountyData.fromJson(Map<String, dynamic> json) {
    print("JSON received for SingleBountyData: $json");
    return SingleBountyData(
      id: json["id"],
      userId: json["user_id"],
      message: json["message"],
      tags: List<dynamic>.from(json["tags"].map((x) => x)),
      urgencyId: json["urgency_id"],
      expiry: json["expiry"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "message": message,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "urgency_id": urgencyId,
        "expiry": expiry,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
