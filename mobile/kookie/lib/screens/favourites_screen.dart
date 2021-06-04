import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/api/favorite_api_client.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/widgets/favorite_item.dart';
import 'package:kookie/widgets/favorite_list.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreen createState() => _FavouritesScreen();
}

class _FavouritesScreen extends State<FavouritesScreen> {
  late List<RecetteDTO> listeRecette;
  @override
  void initState() {
    listeRecette = [];
    FavortiteClient().favoriteList(15).then((value) => setState(() {
          listeRecette = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Favoris"),
          centerTitle: true,
          elevation: 0,
        ),
        body: FavoriteList(
          listeRecette: this.listeRecette,
        ));
  }
}
