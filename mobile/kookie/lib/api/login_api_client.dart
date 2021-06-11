import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kookie/api/api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/CredentialDTO.dart';
import 'package:kookie/services/storage_util.dart';
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
      ProfileDTO p = ProfileDTO.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await StorageUtil.putString(key: 'token', value: p.user!.token!);
      await prefs.setString("id", p.user!.token!);
      profile = p;
      return p;
    } else {
      log(response.body);
      return new ProfileDTO();
    }
  }

  Future<http.Response> getData(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await getDataRequest(url, await StorageUtil.getString(key: "token"));
  }

  Future<http.Response> postData(String url, Map<String, dynamic> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await postDataRequest(
        url, await StorageUtil.getString(key: "token"), jsonEncode(body));
  }
}
