import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:newapp/blocs/weather/weather_bloc.dart';
import 'package:newapp/blocs/weather/weather_event.dart';
import 'package:newapp/blocs/weather/weather_state.dart';
import 'package:newapp/models/weather_model.dart';
import 'package:newapp/page/home/widgets/home_locaiton.dart';
import 'package:newapp/page/home/widgets/home_temperature.dart';
import 'package:newapp/page/home/widgets/home_weather_icon.dart';
import 'package:newapp/providers/weather_provider.dart';

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
    context.read<WeatherProvider>().getWeatherCurrnet();
  }

  Future<void> _loadLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) return;
      }

      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) return;
      }

      final locationData = await _location.getLocation();
    } catch (e) {
      debugPrint('Location error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: FutureBuilder<WeatherModel?>(
            future: context.read<WeatherProvider>().getWeatherCurrnet(),
            builder:
                (BuildContext context, AsyncSnapshot<WeatherModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(color: Colors.white);
                  }
                  if (snapshot.data == null) {
                    return Text(
                      'No data',
                      style: TextStyle(color: Colors.white),
                    );
                  }
                  WeatherModel weather = snapshot.data!;
                  print(weather);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeWeatherIcon(icon: weather.iconUrl),
                      HomeTemperature(temp: weather.temp),
                      HomeLocation(cityName: weather.cityName),
                    ],
                  );
                },
          ),
        ),
      ),
    );
  }
}
