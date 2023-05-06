import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bell_et_social_media_101/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bell - the way you want',
      home: SplashScreen(), //SplashScreen(),
    );
  }
}
