import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
          child: Image.asset(
        "assets/images/Picsart_23-01-22_21-16-21-596.png",
        height: 250,
      )),
    );
  }

  Future<void> gotoLogin() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ScreenLogin();
    }));
  }

  Future<void> checkUserLoggedIn() async {
    final _Sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _Sharedprefs.getBool(SAVE_KEY_NAME);
    await Future.delayed(Duration(seconds: 3));
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}
