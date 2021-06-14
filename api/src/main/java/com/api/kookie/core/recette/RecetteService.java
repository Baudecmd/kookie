package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.data.entity.Profile;

import java.util.List;

public interface RecetteService {
    List<RecetteDTO> searchByString(String s);

    List<RecetteThumbnailDTO> getAllRecipesThumbnails(Integer profileId);

    List<RecetteThumbnailDTO> getAllRecipesThumbnailsByCategoryId(Integer categoryId);

    RecetteDTO getOneById(Integer recipeId);

    List<StepDTO> optimizeRecipes(List<Integer> ids, Profile profile);

    RecetteDTO createRecipe(RecetteDTO recipe);

    List<RecetteDTO> getAllRecipes();
}
