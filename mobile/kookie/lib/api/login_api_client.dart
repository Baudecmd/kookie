import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/CredentialDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiClient extends ApiClient {
  Future<http.Response> authRequest(CredentialDTO credential) async {
    return await httpClient.post(
      Uri.parse(this.urlApi + "/user/auth"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: jsonEncode(credential.toJson()),
    );
  }

  Future<ProfileDTO> login(CredentialDTO credential) async {
    final http.Response response = await authRequest(credential);
    if (response.statusCode == 200) {
      ProfileDTO profile = ProfileDTO.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", profile.user!.token!);
      return profile;
    } else {
      return new ProfileDTO();
    }
  }

  Future<http.Response?> getData(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final http.Response response =
        await getDataRequest(url, (prefs.getString("token"))!);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future<http.Response?> postData(String url, String body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final http.Response response = await postDataRequest(
        url, (prefs.getString("token"))!, jsonEncode(body));
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
