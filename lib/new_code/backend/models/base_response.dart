class BaseResponse<T> {
  late bool status;
  late String message;
  dynamic meta;
  dynamic data;

  BaseResponse({required this.status, required this.message, this.data,this.meta});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    print("Json : ${json['data']}");
    return BaseResponse(
      status: json['status'],
      message: json['message'],
      meta: json['meta'],
      data: fromJson(json['data']) ,
    );
  }

  factory BaseResponse.fromListJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse(
      status: json['status'],
      message: json['message'],
      meta: json['meta'],
      data: json.containsKey('data') ? fromJsonT(json['data']) : null,
    );
  }
}
