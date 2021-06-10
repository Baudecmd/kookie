package com.api.kookie.core.dto;

import java.util.Objects;

public class StepDTO {

    private Integer id;

    private String name;

    private IngredientLineDTO ingredientLine;

    private int duration;

    private Integer stepNumber;

    private boolean isPreparationStep;

    private StepTypeDTO stepType;

    public StepDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public IngredientLineDTO getIngredientLine() {
        return ingredientLine;
    }

    public void setIngredientLine(IngredientLineDTO ingredientLine) {
        this.ingredientLine = ingredientLine;
    }

    public Integer getStepNumber() {
        return stepNumber;
    }

    public void setStepNumber(Integer stepNumber) {
        this.stepNumber = stepNumber;
    }

    public StepTypeDTO getStepType() {
        return stepType;
    }

    public void setStepType(StepTypeDTO stepType) {
        this.stepType = stepType;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isPreparationStep() {
        return isPreparationStep;
    }

    public void setPreparationStep(boolean preparationStep) {
        isPreparationStep = preparationStep;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StepDTO)) return false;
        StepDTO stepDTO = (StepDTO) o;
        return getDuration() == stepDTO.getDuration() && Objects.equals(getId(), stepDTO.getId()) && Objects.equals(getName(), stepDTO.getName()) && Objects.equals(ingredientLine, stepDTO.ingredientLine) && Objects.equals(stepNumber, stepDTO.stepNumber) && Objects.equals(stepType, stepDTO.stepType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), ingredientLine, getDuration(), stepNumber, stepType);
    }

    @Override
    public String toString() {
        return "StepDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", ingredientLine=" + ingredientLine +
                ", duration=" + duration +
                ", stepNumber=" + stepNumber +
                ", stepType=" + stepType +
                ", isPreparationStep=" + isPreparationStep +
                '}';
    }
}
