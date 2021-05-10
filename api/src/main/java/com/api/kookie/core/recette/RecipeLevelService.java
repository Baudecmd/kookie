package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecipeLevelDTO;

import java.util.List;

public interface RecipeLevelService {
    Boolean addRecipeLevel(RecipeLevelDTO recipeLevel);

    Boolean updateRecipeLevel(RecipeLevelDTO recipeLevel);

    Boolean deleteRecipeLevel(Integer recipeLevelId);

    List<RecetteDTO> getAllRecipes(Integer recipeLevelId);
}
