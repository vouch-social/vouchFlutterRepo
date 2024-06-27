import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import 'package:vouch/blocked_page.dart';
import '../../../maintenance_mode_screen.dart';
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
      BaseOptions(baseUrl: baseUrl, responseType: ResponseType.json, contentType: contentType),
    );
    dio.interceptors.add(CustomInterceptor());
  }

  Future<Response<dynamic>> getRequest({
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
      if (de.response?.statusCode == 403) {
        print("Your Account has been blocked. Please contact admin or mail on info@vouch.social.");
        GetX.Get.offAll(() => const BlockedPage());
      }else if(de.response?.statusCode == 503){
        print("Server Under Maintenance");
        GetX.Get.offAll(() => const MaintenanceModeScreen());
      }
      print("DioError: ${de.message}");
      throw BaseApiException.fromDioError(de);
    } on Exception catch (e) {
      print("Exception: ${e.toString()}");
      throw Exception(e.toString());
    } catch (err) {
      print("Unexpected Error: $err");
      rethrow;
    }
  }

  Future<Response<dynamic>> postRequest({
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

      final response = await dio.post(
        endPoint,
        data: data,
        options: myOptions ?? Options(headers: headers),
      );

      return response;
    } on DioError catch (de) {
      if (de.response?.statusCode == 403) {
        print("Your Account has been blocked. Please contact admin or mail on info@vouch.social.");
        GetX.Get.offAll(() => const BlockedPage());
      }else if(de.response?.statusCode == 503){
        print("Server Under Maintenance");
        GetX.Get.offAll(() => const MaintenanceModeScreen());
      }
      print("DioError: ${de.message}");
      throw BaseApiException.fromDioError(de);
    } on Exception catch (e) {
      print("Exception: ${e.toString()}");
      throw Exception(e.toString());
    } catch (error) {
      print("Unexpected Error: $error");
      rethrow;
    }
  }

  Future<Response<dynamic>> patchRequest({
    required String endPoint,
    required dynamic data,
    bool requiresAuthorizationHeader = false,
  }) async {
    try {
      return await dio.patch(
        endPoint,
        data: data,
        options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}),
      );
    } on DioError catch (err) {
      if (err.response?.statusCode == 403) {
        print("Your Account has been blocked. Please contact admin or mail on info@vouch.social.");
        GetX.Get.offAll(() => const BlockedPage());
      }
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response<dynamic>> putRequest({
    required String endPoint,
    required dynamic data,
    bool requiresAuthorizationHeader = false,
  }) async {
    try {
      return await dio.put(
        endPoint,
        data: data,
        options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}),
      );
    } on DioError catch (err) {
      if (err.response?.statusCode == 403) {
        print("Your Account has been blocked. Please contact admin or mail on info@vouch.social.");
        GetX.Get.offAll(() => const BlockedPage());
      }
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response<dynamic>> deleteRequest({
    required String endPoint,
    required dynamic data,
    bool requiresAuthorizationHeader = false,
  }) async {
    try {
      return await dio.delete(
        endPoint,
        data: data,
        options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}),
      );
    } on DioError catch (err) {
      if (err.response?.statusCode == 403) {
        print("Your Account has been blocked. Please contact admin or mail on info@vouch.social.");
        GetX.Get.offAll(() => const BlockedPage());
      }
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }
}
