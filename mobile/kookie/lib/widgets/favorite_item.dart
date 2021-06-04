import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem(this.recette);

  final RecetteDTO recette;
  @override
  Widget build(BuildContext context) {
    return Text(
      recette.name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
