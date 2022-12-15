import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tictac/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(logo: Image.asset('assets/m8.png',),
        logoWidth: 160,
                backgroundColor: Colors.black87,
                title: Text('it\'s  X O  Game',style: TextStyle(color: Colors.white,fontSize: 20),),
                navigator: MyApp(),
                durationInSeconds: 5,
                showLoader: true,
                loadingText: Text('loading..'),
                
                


        ),
      ),
    );
  }
}
