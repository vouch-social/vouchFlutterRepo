import '/backend/schema/structs/index.dart';

class NewCloudFunction2CloudFunctionCallResponse {
  NewCloudFunction2CloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class FindPathsCloudFunctionCallResponse {
  FindPathsCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  dynamic data;
}
