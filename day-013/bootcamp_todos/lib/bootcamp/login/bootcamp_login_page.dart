import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            ElevatedButton(
              onPressed: () async {
                final userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                if (userCredential.user?.uid != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BootcampHomePage(
                      id: userCredential.user!.uid,
                    ),
                  ));
                }
              },
              child: const Text('Sign In Anonymously'),
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                // Trigger the Google Authentication flow.
                final GoogleSignInAccount? googleUser =
                    await GoogleSignIn().signIn();
                // Obtain the auth details from the request.
                final GoogleSignInAuthentication? googleAuth =
                    await googleUser?.authentication;
                // Create a new credential.
                final OAuthCredential googleCredential =
                    GoogleAuthProvider.credential(
                  accessToken: googleAuth!.accessToken,
                  idToken: googleAuth.idToken,
                );
                // Sign in to Firebase with the Google [UserCredential].
                final UserCredential googleUserCredential = await FirebaseAuth
                    .instance
                    .signInWithCredential(googleCredential);

                if (googleUserCredential.user?.uid != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BootcampHomePage(
                      id: googleUserCredential.user!.uid,
                    ),
                  ));
                }
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
