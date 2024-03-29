// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
// original
import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDtaMached = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 110, bottom: 40, top: 100),
                  child: CircleAvatar(
                    child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/Picsart_23-01-22_21-16-21-596.png"),
                        radius: 58),
                    radius: 60,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      border: OutlineInputBorder(),
                      hintText: 'Username'),
                  validator: (value) {
                    if (_isDtaMached) {
                      if (value == null || value.isEmpty) {
                        return 'value is Empty';
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        border: OutlineInputBorder(),
                        hintText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "value is empty";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDtaMached,
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Username password doesnot match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print("user doesnt match");
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //    Goto Home
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[800],
        margin: EdgeInsets.all(10),
        content: Text(
          "Username and Password not match",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
