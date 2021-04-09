import 'package:kookie/api/login_api_client.dart';
import 'package:kookie/models/user/CredentialDTO.dart';
import 'package:kookie/models/user/UserDTO.dart';

class LoginRepository {
  final LoginApiClient loginApiClient = LoginApiClient();

  Future<UserDTO> login(CredentialDTO credential) async {
    return loginApiClient.login(credential);
  }
}
