package com.api.kookie.core.util;

import com.api.kookie.core.dto.OpinionDTO;
import com.api.kookie.data.entity.Opinion;

import java.util.ArrayList;
import java.util.List;

public class OpinionParser {

    public static OpinionDTO toDTO(Opinion opinion) {
        OpinionDTO opinionDTO = new OpinionDTO();
        if (opinion != null) {
            opinionDTO.setId(opinion.getId());
            opinionDTO.setRecette(RecetteParser.toDTO(opinion.getRecette()));
            opinionDTO.setProfile(ProfileParser.toDTO(opinion.getProfile()));
            opinionDTO.setNote(opinionDTO.getNote());
            opinionDTO.setComment(opinion.getComment());
        }
        return opinionDTO;
    }

    public static Opinion toEntity(OpinionDTO opinionDTO) {
        Opinion opinion = new Opinion();
        if (opinionDTO != null) {
            if (opinionDTO.getId() != null) opinion.setId(opinionDTO.getId());
            opinion.setRecette(RecetteParser.toEntity(opinionDTO.getRecette()));
            opinion.setProfile(ProfileParser.toEntity(opinionDTO.getProfile()));
            opinion.setNote(opinionDTO.getNote());
            opinion.setComment(opinionDTO.getComment());
        }
        return opinion;
    }

    public static List<OpinionDTO> parseListToDTO(List<Opinion> opinions) {
        List<OpinionDTO> listOpinionsDTO = new ArrayList<>();
        for (Opinion opinion : opinions) {
            listOpinionsDTO.add(toDTO(opinion));
        }
        return listOpinionsDTO;
    }
}
