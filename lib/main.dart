import 'package:flutter/material.dart';
import 'package:login_page/screens/splash.dart';

const SAVE_KEY_NAME = 'unserLoggedin';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Sample',
      theme: ThemeData.dark(),
      home: ScreenSplash(),
    );
  }
}
