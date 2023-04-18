

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> map = {Constants.KEY_API_KEY: Constants.VALUE_API_KEY};
    options.queryParameters.addAll(map);

    return super.onRequest(options, handler);
  }
}
