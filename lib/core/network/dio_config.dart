import 'package:dio/dio.dart';

// or new Dio with a BaseOptions instance.
var options = BaseOptions(
  baseUrl: 'http://dataservice.accuweather.com',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);
