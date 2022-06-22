import 'package:flutter/material.dart';
import 'package:login/src/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Me in',
      home: Scaffold(
        appBar: AppBar(
         title:const Text('Log in'),
        ),
        body: const LoginScreen(),
      ),
    );
  }
}
