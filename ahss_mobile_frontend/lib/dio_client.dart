import 'package:dio/dio.dart';

Dio dioClient = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.137.28:8000/',
    connectTimeout: 100000,
    receiveTimeout: 100000,
    sendTimeout: 100000,
    headers: {
      'Content-Type': url_encoded,
      'Accept': 'application/json',
    },
  ),
);

const String url_encoded = 'application/x-www-form-urlencoded';
