package com.api.kookie.core.util;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.data.entity.ingredient.IngredientCategory;

import java.util.ArrayList;
import java.util.List;

public class IngredientCategoryParser {

    public static CategoryDTO toDTO(IngredientCategory ingredientCategory) {
        CategoryDTO categoryDTO = new CategoryDTO();
        if (ingredientCategory != null) {
            categoryDTO.setId(ingredientCategory.getId());
            categoryDTO.setName(ingredientCategory.getName());
        }
        return categoryDTO;
    }

    public static IngredientCategory toEntity(CategoryDTO categoryDTO) {
        IngredientCategory ingredientCategory = new IngredientCategory();
        if (categoryDTO != null) {
            if (categoryDTO.getId() != null) ingredientCategory.setId(categoryDTO.getId());
            ingredientCategory.setName(categoryDTO.getName());
        }
        return ingredientCategory;
    }

    public static List<CategoryDTO> parseListToDTO(List<IngredientCategory> categories) {
        List<CategoryDTO> listCategoriesDTO = new ArrayList<>();
        for (IngredientCategory cat : categories) {
            listCategoriesDTO.add(toDTO(cat));
        }
        return listCategoriesDTO;
    }

}
