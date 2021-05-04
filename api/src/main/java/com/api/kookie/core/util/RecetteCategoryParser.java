package com.api.kookie.core.util;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.data.entity.RecetteCategory;
import com.api.kookie.data.entity.ingredient.IngredientCategory;

import java.util.ArrayList;
import java.util.List;

public class RecetteCategoryParser {

    public static CategoryDTO toDTO(RecetteCategory recetteCategory) {
        CategoryDTO categoryDTO = new CategoryDTO();
        if (recetteCategory != null) {
            categoryDTO.setId(recetteCategory.getId());
            categoryDTO.setName(recetteCategory.getName());
        }
        return categoryDTO;
    }

    public static RecetteCategory toEntity(CategoryDTO categoryDTO) {
        RecetteCategory recetteCategory = new RecetteCategory();
        if (categoryDTO != null) {
            if (categoryDTO.getId() != null) recetteCategory.setId(categoryDTO.getId());
            recetteCategory.setName(categoryDTO.getName());
        }
        return recetteCategory;
    }

    public static List<CategoryDTO> parseListToDTO(List<RecetteCategory> categories) {
        List<CategoryDTO> listCategoriesDTO = new ArrayList<>();
        for (RecetteCategory cat : categories) {
            listCategoriesDTO.add(toDTO(cat));
        }
        return listCategoriesDTO;
    }

}
