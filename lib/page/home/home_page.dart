import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:newapp/blocs/weather/weather_bloc.dart';
import 'package:newapp/blocs/weather/weather_event.dart';
import 'package:newapp/blocs/weather/weather_state.dart';
import 'package:newapp/core/network/api_client.dart';
import 'package:newapp/page/home/widgets/home_locaiton.dart';
import 'package:newapp/page/home/widgets/home_temperature.dart';
import 'package:newapp/page/home/widgets/home_weather_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          _fallbackToCity();
          return;
        }
      }

      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) {
          _fallbackToCity();
          return;
        }
      }

      final locationData = await _location.getLocation().timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Location timeout'),
      );

      if (mounted) {
        context.read<WeatherBloc>().add(
          WeatherFetchByLocation(
            lat: locationData.latitude ?? 0,
            lng: locationData.longitude ?? 0,
          ),
        );
      }
    } catch (e) {
      debugPrint('Location error: $e');
      _fallbackToCity();
    }
  }

  void _fallbackToCity() {
    if (mounted) {
      context.read<WeatherBloc>().add(WeatherFetchByCity(city: 'Ho Chi Minh'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => ApiClient.alice.showInspector(),
        child: Icon(Icons.bug_report),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1D6cf3), Color.fromARGB(255, 110, 157, 237)],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading || state is WeatherInitial) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              if (state is WeatherError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              if (state is WeatherLoaded) {
                final weather = state.weather;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeWeatherIcon(icon: weather.iconUrl),
                    HomeTemperature(
                      temp: weather.temp,
                      windSpeed: weather.windSpeed,
                      humidity: weather.humidity,
                    ),
                    HomeLocation(cityName: weather.cityName),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
