import 'package:flutter/material.dart';
import 'package:newapp/widgets/white_text.dart';

class HomeTemperature extends StatelessWidget {
  final double? temp;
  final double? windSpeed;
  final int? humidity;

  const HomeTemperature({super.key, this.temp, this.windSpeed, this.humidity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhiteText(
              '${temp?.round() ?? '--'}',
              fontSize: 100,
              fontWeight: FontWeight.w600,
            ),
            WhiteText('°', fontSize: 36, fontWeight: FontWeight.w600),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset('assets/icons/ph_wind.png', height: 60),
                WhiteText('${windSpeed?.toStringAsFixed(1) ?? '--'}km/h'),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/humidity.png', height: 60),
                WhiteText('${humidity ?? '--'}%'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
