import 'dart:convert';

AllNotificationsModel allNotificationsModelFromJson(String str) => AllNotificationsModel.fromJson(json.decode(str));

String allNotificationsModelToJson(AllNotificationsModel data) => json.encode(data.toJson());

class AllNotificationsModel {
  List<NotificationDatum>? notificationData;

  AllNotificationsModel({
    required this.notificationData,
  });

  factory AllNotificationsModel.fromJson(Map<String, dynamic> json) => AllNotificationsModel(
    notificationData: json["notificationData"] == null
        ? null
        : List<NotificationDatum>.from(json["notificationData"].map((x) => NotificationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notificationData": notificationData == null
        ? null
        : List<dynamic>.from(notificationData!.map((x) => x.toJson())),
  };
}

class NotificationDatum {
  dynamic createdAt;
  dynamic updatedAt;
  dynamic id;
  dynamic userId;
  dynamic notificationType;
  dynamic title;
  dynamic description;
  dynamic status;

  NotificationDatum({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.userId,
    this.notificationType,
    this.title,
    this.description,
    this.status,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
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
