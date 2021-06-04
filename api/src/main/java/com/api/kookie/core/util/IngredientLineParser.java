package com.api.kookie.core.util;

import com.api.kookie.core.dto.IngredientLineDTO;
import com.api.kookie.data.entity.ingredient.IngredientLine;

import java.util.ArrayList;
import java.util.List;

public class IngredientLineParser {

    public static IngredientLineDTO toDTO(IngredientLine ingredientLine) {
        IngredientLineDTO ingredientLineDTO = new IngredientLineDTO();
        if (ingredientLine != null) {
            ingredientLineDTO.setId(ingredientLine.getId());
            //ingredientLineDTO.setRecetteDTO(RecetteParser.toDTO(ingredientLine.getRecette()));
            ingredientLineDTO.setIngredient(IngredientParser.toDTO(ingredientLine.getIngredient()));
            ingredientLineDTO.setQuantity(ingredientLine.getQuantity());
        }
        return ingredientLineDTO;
    }

    public static IngredientLine toEntity(IngredientLineDTO ingredientLineDTO) {
        IngredientLine ingredientLine = new IngredientLine();
        if (ingredientLineDTO != null) {
            if (ingredientLineDTO.getId() != null) ingredientLine.setId(ingredientLineDTO.getId());
            //ingredientLine.setRecette(RecetteParser.toEntity(ingredientLineDTO.getRecetteDTO()));
            ingredientLine.setIngredient(IngredientParser.toEntity(ingredientLineDTO.getIngredient()));
            ingredientLine.setQuantity(ingredientLineDTO.getQuantity());
        }
        return ingredientLine;
    }

    public static List<IngredientLineDTO> parseListToDTO(List<IngredientLine> ingredientLines) {
        List<IngredientLineDTO> listIngredientLinesDTO = new ArrayList<>();
        for (IngredientLine ingredientLine : ingredientLines) {
            listIngredientLinesDTO.add(toDTO(ingredientLine));
        }
        return listIngredientLinesDTO;
    }

    public static List<IngredientLine> parseListToEntity(List<IngredientLineDTO> ingredientLinesDTO) {
        List<IngredientLine> listIngredientLines = new ArrayList<>();
        for (IngredientLineDTO ingredientLineDTO : ingredientLinesDTO) {
            listIngredientLines.add(toEntity(ingredientLineDTO));
        }
        return listIngredientLines;
    }
}
