import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepCreationScreen extends StatefulWidget {
  @override
  _StepCreationScreen createState() => _StepCreationScreen();
}

class _StepCreationScreen extends State<StepCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Text("Décrivez cette étape !"),
              ),
              SizedBox(height: 10),
              Center(child: Text("Quel est le matériel requis ?")),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
