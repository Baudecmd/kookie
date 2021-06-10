import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

class FavoriteClient extends ApiClient {
  Future<List<RecetteDTO>> favoriteList(int id) async {
    final response = await http.get(
      Uri.parse(ApiClient().urlApi +
          "/profile/favorite/all?profileId=" +
          id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      final responseArray = jsonDecode(response.body);

      List<RecetteDTO> listeRecette = [];

      for (var i = 0; i < responseArray.length; i++) {
        listeRecette.add(RecetteDTO.fromJson(responseArray[i]));
      }
      return listeRecette;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
