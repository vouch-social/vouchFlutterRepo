import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../backend_constants.dart';
import 'exception.dart';
import 'interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static String baseUrl = "https://api.vouch.social";
  late Dio dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.json, contentType: contentType));
    dio.interceptors.add(CustomInterceptor());
  }


  Future<Response> getRequest({
    required String endPoint,
    required dynamic data,
    Options? options,
    bool requiresAuthorizationHeader = true,
    String? bearerToken,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (requiresAuthorizationHeader && bearerToken != null) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }

      final response = await dio.get(
        endPoint,
        queryParameters: data,
        options: options ?? Options(headers: headers),
      );
      return response;
    } on DioError catch (de) {
      throw BaseApiException.fromDioError(de);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (err) {
      rethrow;
    }
  }



 Future<Response> postRequest({
    required String endPoint,
    required dynamic data,
    Options? myOptions,
    String? authToken,
    bool requiresAuthorizationHeader = true,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (authToken != null && requiresAuthorizationHeader) {
        headers['Authorization'] = 'Bearer $authToken';
      }
      return await dio.post(
        endPoint,
        data: data,
        options: myOptions ?? Options(headers: headers),
      );
    } on DioException catch (err) {
      print("DioException");
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      print("Exception");
      throw Exception(e.toString());
    } catch (error) {
      print("error");
      rethrow;
    }
  }


  Future<Response> patchRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.patch(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> putRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.put(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.delete(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }
}
