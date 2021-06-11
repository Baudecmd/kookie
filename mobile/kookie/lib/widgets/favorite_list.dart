import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/screens/recipe_detail_screen.dart';
import 'package:kookie/widgets/favorite_item.dart';

class FavoriteList extends StatefulWidget {
  final List<RecetteDTO> listeRecette;
  FavoriteList({Key? key, required this.listeRecette}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemCount: widget.listeRecette.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetails(recipeId: widget.listeRecette[index].id)),
            );
          },
          child: Container(
              height: 70, child: FavoriteItem(widget.listeRecette[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
