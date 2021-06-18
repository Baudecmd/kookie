import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/login_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/step/StepDTO.dart';

class OptimizationApiClient extends LoginApiClient {
  Future<List<StepDTO>?> optimizeSession() async {
    if (recipesToCook.isEmpty) return null;
    Map<String, dynamic> map = Map<String, dynamic>();
    map["recipesIds"] = recipesToCook;
    map["profileId"] = profile!.id.toString();
    final http.Response response =
        await postData('/recipesOptimization/optimize_recipes_list', map);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => StepDTO.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to fetch optimization");
    }
  }
}
