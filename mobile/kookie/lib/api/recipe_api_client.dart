import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';

import 'login_api_client.dart';

class RecipeApiClient extends LoginApiClient {
  Future<List<RecetteThumbnailDTO>?> getAllRecipeThumbnails() async {
    final http.Response response = await getData('/recette/thumbnail/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => RecetteThumbnailDTO.fromJson(e))
            .toList()
        : null;
  }

  Future<RecetteDTO?> createRecipe(RecetteDTO recipe) async {
    final http.Response response =
        await postData('/recette/add', recipe.toJson());
    return response.statusCode == 201
        ? RecetteDTO.fromJson(jsonDecode(response.body))
        : null;
  }
}
