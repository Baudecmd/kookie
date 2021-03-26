package com.api.kookie.core.util;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.data.entity.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryParser {

    public static CategoryDTO toDTO(Category category) {
        CategoryDTO categoryDTO = new CategoryDTO();
        if (category != null) {
            categoryDTO.setId(category.getId());
            categoryDTO.setName(category.getName());
        }
        return categoryDTO;
    }

    public static Category toEntity(CategoryDTO categoryDTO) {
        Category category = new Category();
        if (categoryDTO != null) {
            if (categoryDTO.getId() != null) category.setId(categoryDTO.getId());
            category.setName(categoryDTO.getName());
        }
        return category;
    }

    public static List<CategoryDTO> parseListToDTO(List<Category> categories) {
        List<CategoryDTO> listCategoryDTOs = new ArrayList<>();
        for (Category cat : categories) {
            listCategoryDTOs.add(toDTO(cat));
        }
        return listCategoryDTOs;
    }

}
