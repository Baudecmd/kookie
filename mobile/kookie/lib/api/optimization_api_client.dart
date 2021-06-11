import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/login_api_client.dart';
import 'package:kookie/models/step/StepDTO.dart';

class OptimizationApiClient extends LoginApiClient {
  Future<StepDTO> optimizeSession(Set<int> recipesIds) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["RecipesIds"] = recipesIds.toList();
    jsonEncode(map);
    final http.Response response =
        await postData('/recipesOptimization/optimize_recipes_list', map);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch optimization");
    }
  }
}
