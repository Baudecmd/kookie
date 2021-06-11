package com.api.kookie.core.util;

import com.api.kookie.core.dto.UstensilDTO;
import com.api.kookie.data.entity.Ustensil.Ustensil;

import java.util.ArrayList;
import java.util.List;

public class UstensilParser {

    public static UstensilDTO toDTO(Ustensil ustensil) {
        UstensilDTO ustensilDTO = new UstensilDTO();
        if (ustensil != null) {
            ustensilDTO.setId(ustensil.getId());
            ustensilDTO.setName(ustensil.getNom());
        }
        return ustensilDTO;
    }

    public static Ustensil toEntity(UstensilDTO ustensilDTO) {
        Ustensil ustensil = new Ustensil();
        if (ustensilDTO != null) {
            ustensil.setId(ustensilDTO.getId());
            ustensil.setNom(ustensilDTO.getName());
        }
        return ustensil;
    }

    public static List<UstensilDTO> parseListToDTO(List<Ustensil> ustensils) {
        List<UstensilDTO> listUstensilsDTO = new ArrayList<>();
        for (Ustensil ustensil : ustensils) {
            listUstensilsDTO.add(toDTO(ustensil));
        }
        return listUstensilsDTO;
    }

    public static List<Ustensil> parseListToEntity(List<UstensilDTO> ustensils) {
        List<Ustensil> listUstensils = new ArrayList<>();
        for (UstensilDTO ustensil : ustensils) {
            listUstensils.add(toEntity(ustensil));
        }
        return listUstensils;
    }
}
