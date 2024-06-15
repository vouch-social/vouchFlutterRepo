// To parse this JSON data, do
//
//     final singleIdNotificationsModel = singleIdNotificationsModelFromJson(jsonString);

import 'dart:convert';

SingleIdNotificationsModel singleIdNotificationsModelFromJson(String str) => SingleIdNotificationsModel.fromJson(json.decode(str));

String singleIdNotificationsModelToJson(SingleIdNotificationsModel data) => json.encode(data.toJson());

class SingleIdNotificationsModel {
  NotificationData notificationData;

  SingleIdNotificationsModel({
    required this.notificationData,
  });

  factory SingleIdNotificationsModel.fromJson(Map<String, dynamic> json) => SingleIdNotificationsModel(
    notificationData: NotificationData.fromJson(json["notificationData"]),
  );

  Map<String, dynamic> toJson() => {
    "notificationData": notificationData.toJson(),
  };
}

class NotificationData {
  String createdAt;
  String updatedAt;
  int id;
  int userId;
  String notificationType;
  String title;
  String description;
  String status;

  NotificationData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.notificationType,
    required this.title,
    required this.description,
    required this.status,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    userId: json["user_id"],
    notificationType: json["notification_type"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "user_id": userId,
    "notification_type": notificationType,
    "title": title,
    "description": description,
    "status": status,
  };
}
