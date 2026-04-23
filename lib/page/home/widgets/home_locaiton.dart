import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  final String cityName;

  const HomeLocation({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final dayFm = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/fluent_location-48-regular.png'),
            SizedBox(width: 10),
            Text(
              cityName.isEmpty ? 'Loading...' : cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          dayFm,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
