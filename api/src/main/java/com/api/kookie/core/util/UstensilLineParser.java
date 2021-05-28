package com.api.kookie.core.util;

import com.api.kookie.core.dto.UstensilDTO;
import com.api.kookie.core.dto.UstensilLineDTO;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import com.api.kookie.data.entity.Ustensil.UstensilLine;

import java.util.ArrayList;
import java.util.List;

public class UstensilLineParser {

    public static UstensilLineDTO toDTO(UstensilLine ustensilLine) {
        UstensilLineDTO ustensilLineDTO = new UstensilLineDTO();
        if (ustensilLine != null) {
            ustensilLineDTO.setId(ustensilLine.getId());
            ustensilLineDTO.setUstensil(UstensilParser.toDTO(ustensilLine.getUstensil()));
            ustensilLineDTO.setQuantity(ustensilLine.getNb());
        }
        return ustensilLineDTO;
    }

    public static UstensilLine toEntity(UstensilLineDTO ustensilLineDTO) {
        UstensilLine ustensilLine = new UstensilLine();
        if (ustensilLineDTO != null) {
            ustensilLine.setId(ustensilLineDTO.getId());
            ustensilLine.setUstensil(UstensilParser.toEntity(ustensilLineDTO.getUstensil()));
            ustensilLine.setNb(ustensilLineDTO.getQuantity());
        }
        return ustensilLine;
    }

    public static List<UstensilLineDTO> parseListToDTO(List<UstensilLine> ustensilLines) {
        List<UstensilLineDTO> listUstensilLinesDTO = new ArrayList<>();
        for (UstensilLine ustensilLine : ustensilLines) {
            listUstensilLinesDTO.add(toDTO(ustensilLine));
        }
        return listUstensilLinesDTO;
    }
}
