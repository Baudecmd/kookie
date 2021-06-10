import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';

import '../api/recipe_api_client.dart';
import '../models/ingredient/IngredientDTO.dart';

initData() async {
  listIngredientDTO = await RecipeApiClient().getIngredients() ?? [];
  listUstensilDTO = await RecipeApiClient().getAllUstensils() ?? [];
}

List<IngredientDTO> listIngredientDTO = [];
List<UstensilDTO> listUstensilDTO = [];
ProfileDTO? profile;
