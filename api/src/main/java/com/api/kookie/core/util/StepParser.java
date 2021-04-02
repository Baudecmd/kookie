package com.api.kookie.core.util;

import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.data.entity.Step;

import java.util.ArrayList;
import java.util.List;

public class StepParser {

    public static StepDTO toDTO(Step step) {
        StepDTO stepDTO = new StepDTO();
        if (step != null) {
            stepDTO.setId(step.getId());
            stepDTO.setName(step.getName());
            stepDTO.setDescription(step.getDescription());
            stepDTO.setDuration(step.getDuration());
        }
        return stepDTO;
    }

    public static Step toEntity(StepDTO stepDTO) {
        Step step = new Step();
        if (stepDTO != null) {
            if (stepDTO.getId() != null) step.setId(stepDTO.getId());
            step.setName(stepDTO.getName());
            step.setDescription(stepDTO.getDescription());
            step.setDuration(stepDTO.getDuration());
        }
        return step;
    }

    public static List<StepDTO> parseListToDTO(List<Step> steps) {
        List<StepDTO> listStepsDTO = new ArrayList<>();
        for (Step step : steps) {
            listStepsDTO.add(toDTO(step));
        }
        return listStepsDTO;
    }

}
