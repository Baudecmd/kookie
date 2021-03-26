package com.api.kookie.core.util;

import com.api.kookie.core.dto.IngredientLineDTO;
import com.api.kookie.data.entity.IngredientLine;

import java.util.ArrayList;
import java.util.List;

public class IngredientLineParser {

    public static IngredientLineDTO toDTO(IngredientLine ingredientLine) {
        IngredientLineDTO ingredientLineDTO = new IngredientLineDTO();
        if (ingredientLine != null) {
            ingredientLineDTO.setId(ingredientLine.getId());
            ingredientLineDTO.setRecetteDTO(RecetteParser.toDTO(ingredientLine.getRecette()));
            ingredientLineDTO.setIngredientDTO(IngredientParser.toDTO(ingredientLine.getIngredient()));
            ingredientLineDTO.setQuantity(ingredientLine.getQuantity());
        }
        return ingredientLineDTO;
    }

    public static IngredientLine toEntity(IngredientLineDTO ingredientLineDTO) {
        IngredientLine ingredientLine = new IngredientLine();
        if (ingredientLineDTO != null) {
            if (ingredientLineDTO.getId() != null) ingredientLine.setId(ingredientLineDTO.getId());
            ingredientLine.setRecette(RecetteParser.toEntity(ingredientLineDTO.getRecette()));
            ingredientLine.setIngredient(IngredientParser.toEntity(ingredientLineDTO.getIngredientDTO()));
            ingredientLine.setQuantity(ingredientLineDTO.getQuantity());
        }
        return ingredient;
    }

    public static List<IngredientLineDTO> parseListToDTO(List<IngredientLine> ingredientLines) {
        List<IngredientLineDTO> listIngredientLineDTOs = new ArrayList<>();
        for (IngredientLine ingredientLine : ingredientLines) {
            listIngredientLineDTOs.add(toDTO(ingredientLine));
        }
        return listIngredientLineDTOs;
    }
}
