import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/models/category/CategoryDTO.dart';

import 'login_api_client.dart';

class RecipeCategoryApiClient extends LoginApiClient {
  Future<List<CategoryDTO>?> getAllRecipeCategories() async {
    final http.Response response = await getData('/recipeCategory/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => CategoryDTO.fromJson(e))
            .toList()
        : null;
  }
}
