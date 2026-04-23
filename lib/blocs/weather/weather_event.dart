abstract class WeatherEvent {}

class WeatherFetchByLocation extends WeatherEvent {
  final double lat;
  final double lng;

  WeatherFetchByLocation({required this.lat, required this.lng});
}

class WeatherFetchByCity extends WeatherEvent {
  final String city;

  WeatherFetchByCity({required this.city});
}
