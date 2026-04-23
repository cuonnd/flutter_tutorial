class WeatherModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final String icon;
  final String cityName;
  final double windSpeed;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.description,
    required this.icon,
    required this.cityName,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      description: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
      cityName: json['name'] as String,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }

  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';
}
