import 'dart:convert';

RecommendationModel recommendationModelFromJson(String str) => RecommendationModel.fromJson(json.decode(str));

String recommendationModelToJson(RecommendationModel data) => json.encode(data.toJson());

class RecommendationModel {
  List<Datum> data;

  RecommendationModel({
    required this.data,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) => RecommendationModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String image;
  String headline;
  String goal;
  String hashedPhone;

  Datum({
    required this.name,
    required this.image,
    required this.headline,
    required this.goal,
    required this.hashedPhone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["Name"],
    image: json["Image"],
    headline: json["Headline"],
    goal: json["Goal"],
    hashedPhone: json["hashedPhone"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Image": image,
    "Headline": headline,
    "Goal": goal,
    "hashedPhone": hashedPhone,
  };
}
