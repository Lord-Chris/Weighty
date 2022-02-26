import 'package:flutter/material.dart';
import 'package:weighty/ui/views/login_view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weighty',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const LoginView(),
    );
  }
}