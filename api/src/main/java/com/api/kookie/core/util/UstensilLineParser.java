package com.api.kookie.core.util;

import com.api.kookie.core.dto.UstensilLineDTO;
import com.api.kookie.data.entity.Utensil.UtensilLine;

import java.util.ArrayList;
import java.util.List;

public class UstensilLineParser {

    public static UstensilLineDTO toDTO(UtensilLine utensilLine) {
        UstensilLineDTO ustensilLineDTO = new UstensilLineDTO();
        if (utensilLine != null) {
            ustensilLineDTO.setId(utensilLine.getId());
            ustensilLineDTO.setUstensil(UstensilParser.toDTO(utensilLine.getUstensil()));
            ustensilLineDTO.setQuantity(utensilLine.getNb());
        }
        return ustensilLineDTO;
    }

    public static UtensilLine toEntity(UstensilLineDTO ustensilLineDTO) {
        UtensilLine utensilLine = new UtensilLine();
        if (ustensilLineDTO != null) {
            utensilLine.setId(ustensilLineDTO.getId());
            utensilLine.setUstensil(UstensilParser.toEntity(ustensilLineDTO.getUstensil()));
            utensilLine.setNb(ustensilLineDTO.getQuantity());
        }
        return utensilLine;
    }

    public static List<UstensilLineDTO> parseListToDTO(List<UtensilLine> utensilLines) {
        List<UstensilLineDTO> listUstensilLinesDTO = new ArrayList<>();
        for (UtensilLine utensilLine : utensilLines) {
            listUstensilLinesDTO.add(toDTO(utensilLine));
        }
        return listUstensilLinesDTO;
    }
}
