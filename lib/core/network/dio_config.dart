import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/key_constant.dart';

// or new Dio with a BaseOptions instance.
var options = BaseOptions(
  baseUrl: 'http://dataservice.accuweather.com',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  queryParameters: 
  {
    "apikey": KeyConstant.apiKey,
  }
);
Dio dio = Dio(options);
