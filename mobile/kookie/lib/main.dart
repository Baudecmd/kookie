import 'package:flutter/material.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/services/storage_util.dart';

import 'screens/home_screen.dart';

void main() async {
  await StorageUtil.getInstance();
  runApp(KookieApp());
}

class KookieApp extends StatelessWidget {
  KookieApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kookie',
      theme: ThemeData(
        primaryColor: Color(0xFF66C586),
      ),
      home: HomeScreen(),
    );
  }
}
