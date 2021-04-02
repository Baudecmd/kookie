package com.api.kookie.core.ingredient;

import com.api.kookie.core.dto.IngredientDTO;

import java.util.List;

public interface IngredientService {

    boolean createIngredient(IngredientDTO ingredientDTO);

    List<IngredientDTO> getAllIngredients();

    List<IngredientDTO> getAllIngredientsByCategoryId(Integer categoryId);

}
