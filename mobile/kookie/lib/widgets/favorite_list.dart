import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
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
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: widget.listeRecette.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          child: FavoriteItem(
            recette: widget.listeRecette[index],
            onTap: (int elementIndex) {
              debugPrint(elementIndex.toString());
            },
          ),
        );
      },
    );
  }
}
