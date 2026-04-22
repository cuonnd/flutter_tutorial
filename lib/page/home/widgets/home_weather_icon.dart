import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset(
        '/Users/macone/code/newapp/assets/icons/heavycloudy.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
