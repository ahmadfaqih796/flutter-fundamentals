import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_flavor/flutter_flavor.dart';

// import '../utils/app_config.dart';
// import '../utils/app_utils.dart';
import 'api_interceptor.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: "http://192.168.113.151:3030"));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    // var token = AppUtils.getToken();
    debugPrint('createDio');
    // debugPrint(token);
    // debugPrint(FlavorConfig.instance.variables["baseUrl"]);

    var dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.113.151:3030",
        // headers: {'Authorization': 'Bearer $token'},
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    return dio;
  }
}
