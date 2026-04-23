import 'package:newapp/core/network/api_client.dart';
import 'package:newapp/core/network/api_endpoints.dart';
import 'package:newapp/core/network/api_response.dart';
import 'package:newapp/core/network/base_repository.dart';
import 'package:newapp/models/weather_model.dart';

class WeatherRepository extends BaseRepository {
  Future<ApiResponse<WeatherModel>> getWeatherByLocation(
    double lat,
    double lng,
  ) {
    return safeApiCall(
      () => ApiClient().get(
        ApiEndpoints.weather,
        queryParameters: {
          'lat': lat,
          'lon': lng,
          'appid': ApiEndpoints.apiKey,
          'units': 'metric', // Celsius
          'lang': 'vi',
        },
      ),
      (json) => WeatherModel.fromJson(json),
    );
  }

  Future<ApiResponse<WeatherModel>> getWeatherByCity(String city) {
    return safeApiCall(
      () => ApiClient().get(
        ApiEndpoints.weather,
        queryParameters: {
          'q': city,
          'appid': ApiEndpoints.apiKey,
          'units': 'metric',
          'lang': 'vi',
        },
      ),
      (json) => WeatherModel.fromJson(json),
    );
  }
}
