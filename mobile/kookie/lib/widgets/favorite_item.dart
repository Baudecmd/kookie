import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/screens/home_screen.dart';

typedef FavoriteItemCallBack = void Function(int id);

class FavoriteItem extends StatefulWidget {
  FavoriteItem({required this.recette, required this.onTap});

  final RecetteDTO recette;
  final FavoriteItemCallBack onTap;

  @override
  State<StatefulWidget> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool check = false;

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
          child: Text(widget.recette.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              check = !check;
            });
            widget.onTap(widget.recette.id!);
          },
          child: Icon(
            check ? Icons.remove_circle : Icons.add_circle,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
