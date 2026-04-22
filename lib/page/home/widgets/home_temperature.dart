import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '45',
          style: TextStyle(fontSize: 100, fontWeight: FontWeight(600)),
        ),
        Text('0', style: TextStyle(fontSize: 36, fontWeight: FontWeight(600))),
      ],
    );
  }
}
