import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/api/favorite_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/widgets/favorite_list.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreen createState() => _FavouritesScreen();
}

class _FavouritesScreen extends State<FavouritesScreen> {
  late List<RecetteDTO> listeRecette;
  final GlobalKey<FavoriteListState> _key = GlobalKey();

  @override
  void initState() {
    listeRecette = [];
    FavoriteClient().favoriteList(profile!.id!).then((value) => setState(() {
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
      body: Column(
        children: [
          Expanded(
            child: FavoriteList(
              key: _key,
              listeRecette: this.listeRecette,
            ),
          ),
        ],
      ),
    );
  }
}
