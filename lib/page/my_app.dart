import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/weather/weather_bloc.dart';
import 'package:newapp/core/network/api_client.dart';
import 'package:newapp/page/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => WeatherBloc())],
      child: MaterialApp(
        navigatorKey: ApiClient.alice.getNavigatorKey(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
