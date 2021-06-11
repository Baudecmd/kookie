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
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Mes recettes"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 150),
                      Icon(
                        Icons.article_outlined,
                        size: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Text("Pas de recette trouvée",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
              "Il est peut-être temps que \n tu nous montres tes talents culinaires !",
              textAlign: TextAlign.center),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CustomButton(
                    text: 'CREER UNE RECETTE',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RecipeCreationScreen()))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
