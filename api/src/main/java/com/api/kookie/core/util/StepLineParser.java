/*package com.api.kookie.core.util;

import com.api.kookie.core.dto.StepLineDTO;
import com.api.kookie.data.entity.StepLine;

import java.util.ArrayList;
import java.util.List;

public class StepLineParser {

    public static StepLineDTO toDTO(StepLine stepLine) {
        StepLineDTO stepLineDTO = new StepLineDTO();
        if (stepLine != null) {
            stepLineDTO.setId(stepLine.getId());
            stepLineDTO.setRecetteDTO(RecetteParser.toDTO(stepLine.getRecette()));
            stepLineDTO.setStepDTO(StepParser.toDTO(stepLine.getStep()));
        }
        return stepLineDTO;
    }

    public static StepLine toEntity(StepLineDTO stepLineDTO) {
        StepLine stepLine = new StepLine();
        if (stepLineDTO != null) {
            if (stepLineDTO.getId() != null) stepLine.setId(stepLineDTO.getId());
            stepLine.setRecette(RecetteParser.toEntity(stepLineDTO.getRecetteDTO()));
            stepLine.setStep(StepParser.toEntity(stepLineDTO.getStepDTO()));
        }
        return stepLine;
    }

    public static List<StepLineDTO> parseListToDTO(List<StepLine> stepLines) {
        List<StepLineDTO> listStepLinesDTO = new ArrayList<>();
        for (StepLine stepLine : stepLines) {
            listStepLinesDTO.add(toDTO(stepLine));
        }
        return listStepLinesDTO;
    }

    public static List<StepLine> parseListToEntity(List<StepLineDTO> stepLinesDTO) {
        List<StepLine> listStepLines = new ArrayList<>();
        for (StepLineDTO stepLineDTO : stepLinesDTO) {
            listStepLines.add(toEntity(stepLineDTO));
        }
        return listStepLines;
    }
}

*/