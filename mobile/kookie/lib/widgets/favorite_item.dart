import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/screens/home_screen.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem(this.recette);

  final RecetteDTO recette;
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
            debugPrint("Test Add");
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
