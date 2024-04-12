import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend_constants.dart';


class CustomInterceptor extends Interceptor {
  late SharedPreferences prefs;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers[authorizationHeaderKey] == true) {
      options.headers.remove(authorizationHeaderKey);
      options.headers.addAll({authorizationHeaderTag: "Bearer ${prefs.getString(authToken)}"});
    }

    super.onRequest(options, handler);
  }
}
