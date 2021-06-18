import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/login_api_client.dart';
import 'package:kookie/models/step/StepTypeDTO.dart';

class StepTypeApiClient extends LoginApiClient {
  Future<List<StepTypeDTO>?> getAllStepTypes() async {
    final http.Response response = await getData('/stepType/all');
    return response.statusCode == 200
        ? (jsonDecode(response.body) as List)
            .map((e) => StepTypeDTO.fromJson(e))
            .toList()
        : null;
  }
}
