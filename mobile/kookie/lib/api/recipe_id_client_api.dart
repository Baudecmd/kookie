import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

class RecipeClient extends ApiClient {
  Future<RecetteDTO> recetteFromID(int? id) async {
    final response = await http.get(
      Uri.parse(ApiClient().urlApi +
          "/recette/one?recipeId=" +
          id.toString() +
          "?profileId=" +
          profile!.id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      final responseArray = jsonDecode(response.body);
      return RecetteDTO.fromJson(responseArray);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to get recipe.');
    }
  }
}
