import 'package:flutter/material.dart';

class RecipeCreation extends StatefulWidget {
  @override
  _RecipeCreation createState() => _RecipeCreation();
}

class _RecipeCreation extends State<RecipeCreation> {
  final _recipeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/login_page_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _recipeFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
