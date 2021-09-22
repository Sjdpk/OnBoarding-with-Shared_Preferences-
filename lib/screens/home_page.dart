import 'package:flutter/material.dart';

// import 'package:login_register/cons/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to Home page'),
      ),
    );
  }
}
