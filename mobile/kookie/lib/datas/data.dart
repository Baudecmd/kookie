import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/api/recipe_category_api_client.dart';
import 'package:kookie/api/step_type_api_client.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/step/StepTypeDTO.dart';

initData() async {
  listIngredientDTO = await RecipeApiClient().getIngredients() ?? [];
  listUstensilDTO = await RecipeApiClient().getAllUstensils() ?? [];
  listCategoryDTO =
      await RecipeCategoryApiClient().getAllRecipeCategories() ?? [];
  listStepTypeDTO = await StepTypeApiClient().getAllStepTypes() ?? [];
}

List<IngredientDTO> listIngredientDTO = [];
List<UstensilDTO> listUstensilDTO = [];
List<CategoryDTO> listCategoryDTO = [];
List<StepTypeDTO> listStepTypeDTO = [];
ProfileDTO? profile;
List<int> recipesToCook = [2, 3];
