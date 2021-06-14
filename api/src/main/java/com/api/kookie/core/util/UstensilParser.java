package com.api.kookie.core.util;

import com.api.kookie.core.dto.UstensilDTO;
import com.api.kookie.data.entity.Utensil.Utensil;

import java.util.ArrayList;
import java.util.List;

public class UstensilParser {

    public static UstensilDTO toDTO(Utensil utensil) {
        UstensilDTO ustensilDTO = new UstensilDTO();
        if (utensil != null) {
            ustensilDTO.setId(utensil.getId());
            ustensilDTO.setName(utensil.getName());
        }
        return ustensilDTO;
    }

    public static Utensil toEntity(UstensilDTO ustensilDTO) {
        Utensil utensil = new Utensil();
        if (ustensilDTO != null) {
            utensil.setId(ustensilDTO.getId());
            utensil.setName(ustensilDTO.getName());
        }
        return utensil;
    }

    public static List<UstensilDTO> parseListToDTO(List<Utensil> utensils) {
        List<UstensilDTO> listUstensilsDTO = new ArrayList<>();
        for (Utensil utensil : utensils) {
            listUstensilsDTO.add(toDTO(utensil));
        }
        return listUstensilsDTO;
    }

    public static List<Utensil> parseListToEntity(List<UstensilDTO> ustensils) {
        List<Utensil> listUtensils = new ArrayList<>();
        for (UstensilDTO ustensil : ustensils) {
            listUtensils.add(toEntity(ustensil));
        }
        return listUtensils;
    }
}
