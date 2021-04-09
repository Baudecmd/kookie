import 'package:kookie/api/sign_up_api_client.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';

class SignUpRepository {
  final SignUpApiClient signUpApiClient = SignUpApiClient();

  Future<ProfileDTO> createProfile(ProfileDTO profile) async {
    return signUpApiClient.createProfile(profile);
  }
}
