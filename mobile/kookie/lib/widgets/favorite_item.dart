import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/screens/home_screen.dart';

typedef FavoriteItemCallBack = void Function(int id);

class FavoriteItem extends StatelessWidget {
  FavoriteItem({required this.recette, required this.onTap});

  final RecetteDTO recette;
  final FavoriteItemCallBack onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text(recette.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        GestureDetector(
          onTap: () {
            onTap(recette.id!);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
