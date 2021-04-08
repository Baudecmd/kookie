import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/models/user/UserDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiClient extends ApiClient {
  Future<http.Response> authRequest(String login, String password) async {
    return await httpClient.post(
      Uri.parse(this.urlApi + "/user/auth"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: jsonEncode({'user': login, 'password': password}),
    );
  }

  Future<UserDTO> authentication(String login, String password) async {
    final http.Response response = await authRequest(login, password);
    if (response.statusCode == 200) {
      UserDTO user = UserDTO.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", user.token!);
      return user;
    } else {
      return new UserDTO();
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
