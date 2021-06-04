package com.api.kookie.core.util;

import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.dto.StepTypeDTO;
import com.api.kookie.data.entity.Step;
import com.api.kookie.data.entity.StepType;

import java.util.ArrayList;
import java.util.List;

public class StepTypeParser {

    public static StepTypeDTO toDTO(StepType stepType) {
        StepTypeDTO stepTypeDTO = new StepTypeDTO();
        if (stepType != null) {
            stepTypeDTO.setId(stepType.getId());
            stepTypeDTO.setName(stepType.getName());
        }
        return stepTypeDTO;
    }

    public static StepType toEntity(StepTypeDTO stepTypeDTO) {
        StepType stepType = new StepType();
        if (stepTypeDTO != null) {
            stepType.setId(stepTypeDTO.getId());
            stepType.setName(stepTypeDTO.getName());
        }
        return stepType;
    }

    public static List<StepTypeDTO> parseListToDTO(List<StepType> stepTypes) {
        List<StepTypeDTO> listStepTypesDTO = new ArrayList<>();
        for (StepType stepType : stepTypes) {
            listStepTypesDTO.add(toDTO(stepType));
        }
        return listStepTypesDTO;
    }
}
