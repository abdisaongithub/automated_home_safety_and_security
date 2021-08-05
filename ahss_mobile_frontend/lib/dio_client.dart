import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.137.187:8000/',
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
    headers: {
      'Content-Type': url_encoded,
      'Accept': 'application/json',
    },
  ),
);

const String url_encoded = 'application/x-www-form-urlencoded';
