import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/controller/root_controller.dart';
import 'package:weatherapp/features/screen/help.dart';

import 'features/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RootController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        routes: {
          "homePage": (_) => const HomePage(),
          "helpPage": (_) => const HelpPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherApp(),
      ),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RootController>(builder: (context, controller, _) {
      if (!controller.isSkip) {
        return const HelpPage();
      }
      return const HomePage();
    });
  }
}
