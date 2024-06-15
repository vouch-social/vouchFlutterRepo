class AttributesModel {
  Data data;

  AttributesModel({
    required this.data,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) => AttributesModel(
    data: Data.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}