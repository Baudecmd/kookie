import '../api/recipe_api_client.dart';
import '../models/ingredient/IngredientDTO.dart';

initData() async {
  listIngredientDTO = await RecipeApiClient().getIngredients() ?? [];
}

List<IngredientDTO> listIngredientDTO = [];
