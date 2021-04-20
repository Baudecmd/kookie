import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/screens/recipe_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class MyRecipesScreen extends StatefulWidget {
  @override
  _MyRecipesScreen createState() => _MyRecipesScreen();
}

class _MyRecipesScreen extends State<MyRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => MyRecipesScreen())),
        ),
        title: Text("Sample"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CustomButton(
                  text: 'CREER UNE RECETTE',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RecipeCreationScreen()))),
            ),
          ),
        ],
      ),
    );
  }
}
