import 'package:kookie/api/profile_api_client.dart';

class ProfileRepository {
  final ProfileApiClient profileApiClient = ProfileApiClient();

  Future<bool> addRecipeToFavorite(int profileId, int recipeId) async {
    return profileApiClient.addRecipeToFavorite(profileId, recipeId);
  }
}
