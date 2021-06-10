package com.api.kookie.core.util;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.data.entity.Opinion;
import com.api.kookie.data.entity.Recette;

import java.util.ArrayList;
import java.util.List;

public class RecetteParser {
    public static RecetteDTO toDTO(Recette recette) {
        RecetteDTO recetteDTO = new RecetteDTO();
        if (recette != null) {
            recetteDTO.setId(recette.getId());
            recetteDTO.setProfile(ProfileParser.toDTO(recette.getCreateur()));
            recetteDTO.setName(recette.getNom());
            recetteDTO.setImage(recette.getImage());
            recetteDTO.setCategory(RecipeCategoryParser.toDTO(recette.getCategory()));
            recetteDTO.setIngredientLines(IngredientLineParser.parseListToDTO(recette.getIngredientLines()));
            recetteDTO.setSteps(StepParser.parseListToDTO(recette.getSteps()));
            recetteDTO.setOpinions(OpinionParser.parseListToDTO(recette.getOpinions()));

        }
        return recetteDTO;
    }

    public static Recette toEntity(RecetteDTO recetteDTO) {
        Recette recette = new Recette();
        if (recetteDTO != null) {
            recette.setId(recetteDTO.getId());
            recette.setCreateur(ProfileParser.toEntity(recetteDTO.getProfile()));
            recette.setNom(recetteDTO.getName());
            recette.setImage(recetteDTO.getImage());
            recette.setCategory(RecipeCategoryParser.toEntity(recetteDTO.getCategory()));
            recette.setIngredientLines(IngredientLineParser.parseListToEntity(recetteDTO.getIngredientLines()));
            recette.setSteps(StepParser.parseListToEntity(recetteDTO.getSteps()));
            recette.setOpinions(OpinionParser.parseListEntity(recetteDTO.getOpinions()));
        }
        return recette;
    }

    public static List<RecetteDTO> parseListToDTO(List<Recette> recettes) {
        List<RecetteDTO> listRecettesDTO = new ArrayList<>();
        for (Recette recette : recettes) {
            listRecettesDTO.add(toDTO(recette));
        }
        return listRecettesDTO;
    }
}
