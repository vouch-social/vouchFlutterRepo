// To parse this JSON data, do
//
//     final goalsRecommendationResponseModel = goalsRecommendationResponseModelFromJson(jsonString);

import 'dart:convert';

GoalsRecommendationResponseModel goalsRecommendationResponseModelFromJson(String str) => GoalsRecommendationResponseModel.fromJson(json.decode(str));

String goalsRecommendationResponseModelToJson(GoalsRecommendationResponseModel data) => json.encode(data.toJson());

class GoalsRecommendationResponseModel {
  List<String> goals;

  GoalsRecommendationResponseModel({
    required this.goals,
  });

  factory GoalsRecommendationResponseModel.fromJson(Map<String, dynamic> json) => GoalsRecommendationResponseModel(
    goals: List<String>.from(json["goals"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "goals": List<dynamic>.from(goals.map((x) => x)),
  };
}
