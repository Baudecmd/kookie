package com.api.kookie.core.recette;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;

import java.util.List;

public interface RecipeCategoryService {
    List<CategoryDTO> getAllCategories();

    List<RecetteDTO> getAllByCategoryId(Integer categoryId);

    List<CategoryDTO> getAllRecipesCategoriesContainsRecipe();
}
