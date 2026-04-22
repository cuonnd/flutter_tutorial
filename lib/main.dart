import 'package:flutter/material.dart';
import 'package:newapp/screens/home.dart';
import 'package:newapp/screens/screen1.dart';
import 'package:newapp/screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class Routes {
  static const String screen1 = "/screen1";
  static const String screen2 = "/screen2";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.screen1:
              return MaterialPageRoute(builder: (_) => Screen1());
            case Routes.screen2:
              return MaterialPageRoute(builder: (_) => Screen2());
            default:
              return MaterialPageRoute(builder: (_) => MyHomePage());
          }
        },
        home: MyHomePage(),
        debugShowCheckedModeBanner: false, // Ẩn chữ DEBUG
        // home: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.deepPurple,
        //     title: Text('Flutter Demo'),
        //   ),
        //   body: const Center(child: Text('Hello, World!')),
        // ),
      ),
    );
  }
}
