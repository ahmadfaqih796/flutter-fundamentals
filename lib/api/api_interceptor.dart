// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:dio/dio.dart';
// import 'package:hadir_mobile_v2/utils/app_utils.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = "";
    // options.headers = {'Authorization': token};
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.response);
    print('from dio');
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}
