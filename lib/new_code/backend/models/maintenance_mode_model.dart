// To parse this JSON data, do
//
//     final maintenanceModeModel = maintenanceModeModelFromJson(jsonString);

import 'dart:convert';

MaintenanceModeModel maintenanceModeModelFromJson(String str) => MaintenanceModeModel.fromJson(json.decode(str));

String maintenanceModeModelToJson(MaintenanceModeModel data) => json.encode(data.toJson());

class MaintenanceModeModel {
  bool maintenanceMode;

  MaintenanceModeModel({
    required this.maintenanceMode,
  });

  factory MaintenanceModeModel.fromJson(Map<String, dynamic> json) => MaintenanceModeModel(
    maintenanceMode: json["maintenanceMode"],
  );

  Map<String, dynamic> toJson() => {
    "maintenanceMode": maintenanceMode,
  };
}
