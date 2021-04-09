import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_api_client.dart';

class SignUpApiClient extends LoginApiClient {
  Future<ProfileDTO> createProfile(ProfileDTO profile) async {
    final http.Response response =
        (await postData('/profile/create', jsonEncode(profile.toJson())))!;
    if (response.statusCode == 201) {
      ProfileDTO profile = ProfileDTO.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", profile.user!.token!);
      return profile;
    } else {
      return new ProfileDTO();
    }
  }
}
