import 'package:http/http.dart' as http;

class ApiClient {
  //final String urlApi = "http://10.0.2.2:8080";
  final String urlApi = "https://api-cookie-env-staging.herokuapp.com";
  final http.Client httpClient = http.Client();

  Future<http.Response> getDataRequest(String url, String token) async {
    return await httpClient.get(Uri.parse(urlApi + url), headers: {
      "Authorization": "token" + token,
    });
  }

  Future<http.Response> postDataRequest(
      String url, String token, String body) async {
    return await httpClient.post(
      Uri.parse(urlApi + url),
      headers: {
        "Authorization": "token" + token,
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: body,
    );
  }
}
