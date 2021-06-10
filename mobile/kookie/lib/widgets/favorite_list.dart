import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/widgets/favorite_item.dart';

class FavoriteList extends StatefulWidget {
  final List<RecetteDTO> listeRecette;
  const FavoriteList({required Key? key, required this.listeRecette})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FavoriteListState();
}

class FavoriteListState extends State<FavoriteList> {
  final Set<int> _recipesIds = Set<int>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: widget.listeRecette.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: Container(
            height: 70,
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            child: FavoriteItem(
              recette: widget.listeRecette[index],
              onTap: (int elementId) {
                _recipesIds.add(elementId);
              },
            ),
          ),
        );
      },
    );
  }

  Set<int> getRecipesIds() {
    return _recipesIds;
  }
}
