import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BootcampHomePage extends StatefulWidget {
  final String id;

  const BootcampHomePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<BootcampHomePage> createState() => _BootcampHomePageState();
}

class _BootcampHomePageState extends State<BootcampHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Home'),
        actions: [
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome user with\nid ${widget.id}!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
