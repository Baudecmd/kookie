import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/CredentialDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiClient extends ApiClient {
  Future<http.Response> unauthenticatedPostRequest(
      String url, Map<String, dynamic> body) async {
    return await httpClient.post(
      Uri.parse(this.urlApi + url),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: jsonEncode(body),
    );
  }

  Future<ProfileDTO> login(CredentialDTO credential) async {
    final http.Response response =
        await unauthenticatedPostRequest('/user/auth', credential.toJson());
    if (response.statusCode == 200) {
      ProfileDTO profile = ProfileDTO.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", profile.user!.token!);
      await prefs.setString("id", profile.user!.token!);

      return profile;
    } else {
      log(response.body);
      return new ProfileDTO();
    }
  }

  Future<http.Response> getData(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await getDataRequest(url, (prefs.getString("token"))!);
  }

  Future<http.Response> postData(String url, Map<String, dynamic> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await postDataRequest(
        url, (prefs.getString("token"))!, jsonEncode(body));
  }
}
