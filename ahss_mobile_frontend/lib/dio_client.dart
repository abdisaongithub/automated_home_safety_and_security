import 'package:dio/dio.dart';

Dio dioClient = Dio(
  BaseOptions(
    baseUrl: 'http://10.240.72.185:8000/',
    connectTimeout: 100000,
    receiveTimeout: 100000,
    sendTimeout: 100000,
    headers: {
      'Content-Type': url_encoded,
      'Accept': 'application/json',
      'Connection' : 'keep-alive',
    },
  ),
);

const String url_encoded = 'application/x-www-form-urlencoded';
