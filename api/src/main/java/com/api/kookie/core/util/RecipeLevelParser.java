package com.api.kookie.core.util;

import com.api.kookie.core.dto.RecipeLevelDTO;
import com.api.kookie.data.entity.RecipeLevel;

import java.util.ArrayList;
import java.util.List;

public class RecipeLevelParser {

    public static RecipeLevelDTO toDTO(RecipeLevel recipeLevel) {
        RecipeLevelDTO recipeLevelDTO = new RecipeLevelDTO();
        if (recipeLevel != null) {
            recipeLevelDTO.setId(recipeLevel.getId());
            recipeLevelDTO.setName(recipeLevel.getName());
        }
        return recipeLevelDTO;
    }

    public static RecipeLevel toEntity(RecipeLevelDTO recipeLevelDTO) {
        RecipeLevel recipeLevel = new RecipeLevel();
        if (recipeLevelDTO != null) {
            if (recipeLevelDTO.getId() != null) recipeLevel.setId(recipeLevelDTO.getId());
            recipeLevel.setName(recipeLevelDTO.getName());
        }
        return recipeLevel;
    }

    public static List<RecipeLevelDTO> parseListToDTO(List<RecipeLevel> recipeLevels) {
        List<RecipeLevelDTO> listRecipesDTO = new ArrayList<>();
        for (RecipeLevel lev : recipeLevels) {
            listRecipesDTO.add(toDTO(lev));
        }
        return listRecipesDTO;
    }
}
