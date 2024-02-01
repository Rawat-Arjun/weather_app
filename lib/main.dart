import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_json/provider/data.dart';
import 'package:weather_json/search_page.dart';
import 'package:weather_json/weather_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weather App',
        initialRoute: '/',
        routes: {
          '/': (context) => const WeatherPage(),
          'search': (context) => const SearchPage()
        },
      ),
    );
  }
}
