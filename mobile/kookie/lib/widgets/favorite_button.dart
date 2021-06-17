import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/repositories/profile_repository.dart';

class FavoriteButton extends StatefulWidget {
  final RecetteDTO recipe;

  const FavoriteButton({Key? key, required this.recipe}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  ProfileRepository profileRepository = ProfileRepository();

  @override
  Widget build(BuildContext context) {
    if (widget.recipe.isFavorite != null) {
      return GestureDetector(
        onTap: () {
          profileRepository
              .addRecipeToFavorite(profile!.id!, widget.recipe.id!)
              .then((value) {
            setState(() {
              widget.recipe.isFavorite = value;
            });
          });
        },
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.recipe.isFavorite!
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Icon(
              Icons.favorite_border_sharp,
              color: widget.recipe.isFavorite!
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              size: 20,
            )),
      );
    }
    return Container();
  }
}
