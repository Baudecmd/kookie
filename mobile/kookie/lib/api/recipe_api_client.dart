import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';

import '../models/ingredient/IngredientDTO.dart';
import 'login_api_client.dart';

class RecipeApiClient extends LoginApiClient {
  Future<List<RecetteThumbnailDTO>?> getAllRecipeThumbnails() async {
    if (profile != null) {
      final http.Response response = await getData(
          '/recette/thumbnail/all?profileId=' + profile!.id.toString());
      return response.statusCode == 200
          ? (jsonDecode(response.body) as List)
              .map((e) => RecetteThumbnailDTO.fromJson(e))
              .toList()
          : null;
    }
    return null;
  }

  Future<RecetteDTO?> createRecipe(RecetteDTO recipe) async {
    final http.Response response =
        await postData('/recette/create', recipe.toJson());
    if (response.statusCode != 201) log(response.body);
    return response.statusCode == 201
        ? RecetteDTO.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<List<RecetteThumbnailDTO>?> getAllRecipeThumbnailsByCategory(
      CategoryDTO category) async {
    final http.Response response = await getData(
        '/recette/thumbnail/byCategory?categoryId=' +
            category.id!.toString() +
            "&profileId=" +
            profile!.id.toString());
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => RecetteThumbnailDTO.fromJson(e))
            .toList()
        : null;
  }

  Future<List<IngredientDTO>?> getIngredients() async {
    final http.Response response = await getData('/ingredient/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => IngredientDTO.fromJson(e))
            .toList()
        : null;
  }

  Future<List<UstensilDTO>?> getAllUstensils() async {
    final http.Response response = await getData('/ustensils/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => UstensilDTO.fromJson(e))
            .toList()
        : null;
  }

  Future<RecetteDTO?> getOneRecipe(int recipeId) async {
    if (profile != null) {
      final http.Response response = await getData(
          '/recette/one?profileId=${profile!.id}&recipeId=$recipeId');
      return response.statusCode == 200
          ? RecetteDTO.fromJson(jsonDecode(response.body))
          : null;
    }
    return null;
  }
}
