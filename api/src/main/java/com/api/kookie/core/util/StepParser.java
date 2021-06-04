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
            stepDTO.setName(step.getStepName());
            stepDTO.setIngredientLine(IngredientLineParser.toDTO(step.getIngredientLine()));
            stepDTO.setDuration(step.getDuration());
            stepDTO.setStepNumber(step.getStepNumber());
            stepDTO.setStepType(StepTypeParser.toDTO(step.getStepType()));
        }
        return stepDTO;
    }

    public static Step toEntity(StepDTO stepDTO) {
        Step step = new Step();
        if (stepDTO != null) {
            step.setId(stepDTO.getId());
            step.setStepName(stepDTO.getName());
            step.setIngredientLine(IngredientLineParser.toEntity(stepDTO.getIngredientLine()));
            step.setDuration(stepDTO.getDuration());
            step.setStepNumber(stepDTO.getStepNumber());
            step.setStepType(StepTypeParser.toEntity(stepDTO.getStepType()));
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