import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../home/bootcamp_home_page.dart';

class BootcampLoginPage extends StatefulWidget {
  const BootcampLoginPage({Key? key}) : super(key: key);

  @override
  State<BootcampLoginPage> createState() => _BootcampLoginPageState();
}

class _BootcampLoginPageState extends State<BootcampLoginPage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bootcamp',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const BootcampHomePage(
                    id: '',
                    firstName: '',
                  ),
                ));
              },
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.Twitter,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
