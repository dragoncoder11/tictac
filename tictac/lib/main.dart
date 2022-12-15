import 'package:flutter/material.dart';
import 'package:tictac/splash.dart';

import 'homepage.dart';

void main() {
  runApp(const SplashScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

