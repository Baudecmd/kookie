package com.api.kookie.core.util;

import com.api.kookie.core.dto.IngredientDTO;
import com.api.kookie.data.entity.ingredient.Ingredient;

import java.util.ArrayList;
import java.util.List;

public class IngredientParser {

    public static IngredientDTO toDTO(Ingredient ingredient) {
        IngredientDTO ingredientDTO = new IngredientDTO();
        if (ingredient != null) {
            ingredientDTO.setId(ingredient.getId());
            ingredientDTO.setName(ingredient.getName());
            ingredientDTO.setVegan(ingredient.isIsVegan());
            ingredientDTO.setCategory(IngredientCategoryParser.toDTO(ingredient.getCategory()));
        }
        return ingredientDTO;
    }

    public static Ingredient toEntity(IngredientDTO ingredientDTO) {
        Ingredient ingredient = new Ingredient();
        if (ingredientDTO != null) {
            if (ingredientDTO.getId() != null) ingredient.setId(ingredientDTO.getId());
            ingredient.setName(ingredientDTO.getName());
            ingredient.setIsVegan(ingredientDTO.isVegan());
            ingredient.setCategory(IngredientCategoryParser.toEntity(ingredientDTO.getCategory()));
        }
        return ingredient;
    }

    public static List<IngredientDTO> parseListToDTO(List<Ingredient> ingredients) {
        List<IngredientDTO> listIngredientsDTO = new ArrayList<>();
        for (Ingredient ingredient : ingredients) {
            listIngredientsDTO.add(toDTO(ingredient));
        }
        return listIngredientsDTO;
    }
}
