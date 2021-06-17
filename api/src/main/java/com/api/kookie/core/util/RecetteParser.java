package com.api.kookie.core.util;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.data.entity.Recipe;

import java.util.ArrayList;
import java.util.List;

public class RecetteParser {
    public static RecetteDTO toDTO(Recipe recipe) {
        RecetteDTO recetteDTO = new RecetteDTO();
        if (recipe != null) {
            recetteDTO.setId(recipe.getId());
            recetteDTO.setProfile(ProfileParser.toDTO(recipe.getCreator()));
            recetteDTO.setName(recipe.getName());
            recetteDTO.setImage(recipe.getImage());
            recetteDTO.setCategory(RecipeCategoryParser.toDTO(recipe.getCategory()));
            recetteDTO.setIngredientLines(IngredientLineParser.parseListToDTO(recipe.getIngredientLines()));
            recetteDTO.setSteps(StepParser.parseListToDTO(recipe.getSteps()));
            if (recetteDTO.getOpinions() != null) recetteDTO.setOpinions(OpinionParser.parseListToDTO(recipe.getOpinions()));

        }
        return recetteDTO;
    }

    public static Recipe toEntity(RecetteDTO recetteDTO) {
        Recipe recipe = new Recipe();
        if (recetteDTO != null) {
            recipe.setId(recetteDTO.getId());
            recipe.setCreator(ProfileParser.toEntity(recetteDTO.getProfile()));
            recipe.setName(recetteDTO.getName());
            recipe.setImage(recetteDTO.getImage());
            recipe.setCategory(RecipeCategoryParser.toEntity(recetteDTO.getCategory()));
            recipe.setIngredientLines(IngredientLineParser.parseListToEntity(recetteDTO.getIngredientLines()));
            recipe.setSteps(StepParser.parseListToEntity(recetteDTO.getSteps()));
            if (recipe.getOpinions()!=null) recipe.setOpinions(OpinionParser.parseListEntity(recetteDTO.getOpinions()));
        }
        return recipe;
    }

    public static List<RecetteDTO> parseListToDTO(List<Recipe> recipes) {
        List<RecetteDTO> listRecettesDTO = new ArrayList<>();
        for (Recipe recipe : recipes) {
            listRecettesDTO.add(toDTO(recipe));
        }
        return listRecettesDTO;
    }
}
