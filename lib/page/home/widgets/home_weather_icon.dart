import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
  final String? icon;

  const HomeWeatherIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Image.network(icon!, width: 250, height: 250, fit: BoxFit.cover);
    }
    return Image.asset('assets/icons/heavycloudy.png', fit: BoxFit.contain);
  }
}
