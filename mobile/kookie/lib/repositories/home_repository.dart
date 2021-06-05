import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/api/recipe_category_api_client.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';

class HomeRepository {
  final RecipeApiClient recipeApiClient = RecipeApiClient();
  final RecipeCategoryApiClient recipeCategoryApiClient =
      RecipeCategoryApiClient();

  Future<List<RecetteThumbnailDTO>?> getAllRecipeThumbnails() async {
    return recipeApiClient.getAllRecipeThumbnails();
  }

  Future<List<RecetteThumbnailDTO>?> getAllRecipeThumbnailsByCategory(
      CategoryDTO category) async {
    return recipeApiClient.getAllRecipeThumbnailsByCategory(category);
  }

  Future<List<CategoryDTO>?> getAllRecipeCategoriesContainsRecipe() async {
    return recipeCategoryApiClient.getAllRecipeCategoriesContainsRecipe();
  }
}
