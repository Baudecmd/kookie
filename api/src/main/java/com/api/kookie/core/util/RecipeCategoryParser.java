package com.api.kookie.core.util;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.data.entity.RecipeCategory;

import java.util.ArrayList;
import java.util.List;

public class RecipeCategoryParser {

    public static CategoryDTO toDTO(RecipeCategory recipeCategory) {
        CategoryDTO categoryDTO = new CategoryDTO();
        if (recipeCategory != null) {
            categoryDTO.setId(recipeCategory.getId());
            categoryDTO.setName(recipeCategory.getName());
        }
        return categoryDTO;
    }

    public static RecipeCategory toEntity(CategoryDTO categoryDTO) {
        RecipeCategory recipeCategory = new RecipeCategory();
        if (categoryDTO != null) {
            if (categoryDTO.getId() != null) recipeCategory.setId(categoryDTO.getId());
            recipeCategory.setName(categoryDTO.getName());
        }
        return recipeCategory;
    }

    public static List<CategoryDTO> parseListToDTO(List<RecipeCategory> categories) {
        List<CategoryDTO> listCategoriesDTO = new ArrayList<>();
        for (RecipeCategory cat : categories) {
            listCategoriesDTO.add(toDTO(cat));
        }
        return listCategoriesDTO;
    }

}
