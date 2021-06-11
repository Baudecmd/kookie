import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/login_api_client.dart';

class ProfileApiClient extends LoginApiClient {
  Future<bool> addRecipeToFavorite(int profileId, int recipeId) async {
    final http.Response response = await getData(
        '/profile/favorite/add?profileId=' +
            profileId.toString() +
            '&recetteId=' +
            recipeId.toString());
    return response.statusCode == 200
        ? (jsonDecode(response.body) as bool)
        : false;
  }
}
