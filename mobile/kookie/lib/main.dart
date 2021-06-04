import 'package:flutter/material.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/screens/login_screen.dart';
import 'package:kookie/screens/signup_screen.dart';
import 'package:kookie/screens/start_screen.dart';
import 'package:kookie/services/storage_util.dart';

void main() async {
  await StorageUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kookie',
      theme: ThemeData(
        primaryColor: Color(0xFF66C586),
      ),
      home: StartScreen(),
    );
  }
}
