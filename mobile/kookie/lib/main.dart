import 'package:flutter/material.dart';
import 'package:kookie/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kookie',
      theme: ThemeData(
        primaryColor: Color(0xFF66C586),
      ),
      home: StartScreen(),
    );
  }
}
