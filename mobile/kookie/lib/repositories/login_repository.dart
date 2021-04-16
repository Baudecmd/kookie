import 'package:kookie/api/login_api_client.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/CredentialDTO.dart';

class LoginRepository {
  final LoginApiClient loginApiClient = LoginApiClient();

  Future<ProfileDTO> login(CredentialDTO credential) async {
    return loginApiClient.login(credential);
  }
}
