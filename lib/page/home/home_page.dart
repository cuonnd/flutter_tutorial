import 'package:flutter/material.dart';
import 'package:newapp/page/home/widgets/home_temperature.dart';
import 'package:newapp/page/home/widgets/home_weather_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Column(
            children: [
              HomeWeatherIcon(),
              HomeTemperature(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/fluent_location-48-regular.png',
                      ),
                      SizedBox(width: 10),
                      Text(
                        'HoChiMinh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '22-04-2025',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight(400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
