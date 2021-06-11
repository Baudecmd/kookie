import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kookie/models/Ustensil/UstensilDTO.dart';

import 'login_api_client.dart';

class UstensilAPIClient extends LoginApiClient {
  Future<List<UstensilDTO>?> getAllUstensils() async {
    final http.Response response = await getData('/ustensils/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => UstensilDTO.fromJson(e))
            .toList()
        : null;
  }
}
