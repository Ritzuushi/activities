import 'package:flutter/material.dart';

class BootcampHomePage extends StatefulWidget {
  final String id;
  final String firstName;

  const BootcampHomePage({
    Key? key,
    required this.id,
    required this.firstName,
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
            onPressed: () {},
            child: const Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${widget.firstName}!',
        ),
      ),
    );
  }
}
