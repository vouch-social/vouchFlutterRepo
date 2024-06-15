// To parse this JSON data, do
//
//     final searchBarRecommendationModel = searchBarRecommendationModelFromJson(jsonString);

import 'dart:convert';

SearchBarRecommendationModel searchBarRecommendationModelFromJson(String str) => SearchBarRecommendationModel.fromJson(json.decode(str));

String searchBarRecommendationModelToJson(SearchBarRecommendationModel data) => json.encode(data.toJson());

class SearchBarRecommendationModel {
  List<SearchBarDemoMessage> searchBarDemoMessages;

  SearchBarRecommendationModel({
    required this.searchBarDemoMessages,
  });

  factory SearchBarRecommendationModel.fromJson(Map<String, dynamic> json) => SearchBarRecommendationModel(
    searchBarDemoMessages: List<SearchBarDemoMessage>.from(json["searchBarDemoMessages"].map((x) => SearchBarDemoMessage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "searchBarDemoMessages": List<dynamic>.from(searchBarDemoMessages.map((x) => x.toJson())),
  };
}

class SearchBarDemoMessage {
  String title;
  String body;

  SearchBarDemoMessage({
    required this.title,
    required this.body,
  });

  factory SearchBarDemoMessage.fromJson(Map<String, dynamic> json) => SearchBarDemoMessage(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
