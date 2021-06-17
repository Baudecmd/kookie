import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';

class SearchRecipe extends SearchDelegate {
  RecetteThumbnailDTO? selectedResults;
  List<String> recentList = [];
  final List<RecetteThumbnailDTO> listRecetteTmb;

  SearchRecipe({required this.listRecetteTmb});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(selectedResults!.name),
            selectedResults!.imageURL == null
                ? Image(
                    image:
                        MemoryImage(base64Decode(selectedResults!.imageURL!)),
                  )
                : Text('pas d\'image'),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = listRecetteTmb.map((e) => e.name).toList();
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(
            suggestions.where(
              (element) => element.contains(query),
            ),
          );
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          onTap: () {
            selectedResults = listRecetteTmb[index];
            showResults(context);
          },
        );
      },
    );
  }
}
