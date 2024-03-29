import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

// original

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      content: const Text("Do you want exit"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            signout(context);
                          },
                          child: const Text("Yes"),
                        )
                      ],
                    );
                  }),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, intex) {
                return ListTile(
                  title: const Text('PERSON '),
                  subtitle: Text('message $intex'),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.yellow,
                    backgroundImage: NetworkImage(
                      "https://cdn.logojoy.com/wp-content/uploads/2018/08/30154311/116.png",
                    ),
                  ),
                  trailing: Text('1$intex:00 PM'),
                );
              },
              separatorBuilder: (ctx, intex) {
                return const Divider();
              },
              itemCount: 20),
        ));
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  }
}
