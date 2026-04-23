import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:newapp/models/weather_model.dart';

class ApiRepository {
  Future<WeatherModel?> callApiGet() async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=7d0e78e7311ced17be20a914ee084535&units=metric&lang=vi',
      );
      return WeatherModel.fromJson(res.data);
    } catch (e) {
      debugPrint('API error: $e');
      return null;
    }
  }
}
