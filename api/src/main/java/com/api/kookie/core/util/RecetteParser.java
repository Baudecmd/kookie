package com.api.kookie.core.util;

import com.api.kookie.core.dto.RecetteDTO;
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
            recetteDTO.setIngredientLines(IngredientLineParser.parseListToDTO(recette.getIngredientLines()));
            // recetteDTO.setStepLinesDTO(StepLineParser.parseListToDTO(recette.getStepLines()));
        }
        return recetteDTO;
    }

    public static Recette toEntity(RecetteDTO recetteDTO) {
        Recette recette = new Recette();
        if (recetteDTO != null) {
            recette.setId(recetteDTO.getId());
            recette.setCreateur(ProfileParser.toEntity(recetteDTO.getProfile()));
            recette.setNom(recetteDTO.getName());
            recette.setIngredientLines(IngredientLineParser.parseListToEntity(recetteDTO.getIngredientLines()));
            // recette.setStepLines(StepLineParser.parseListToEntity(recetteDTO.getStepLinesDTO()));
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
