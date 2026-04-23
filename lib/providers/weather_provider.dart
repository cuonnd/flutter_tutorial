import 'package:flutter/material.dart';
import 'package:newapp/models/weather_model.dart';
import 'package:newapp/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  final ApiRepository _apiRepo = ApiRepository();

  Future<WeatherModel?> getWeatherCurrnet() async {
    return await _apiRepo.callApiGet();
  }
}
