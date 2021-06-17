package com.api.kookie.core.dto;

import java.util.List;
import java.util.Objects;

public class StepDTO {

    private Integer id;

    private String name;

    private List<IngredientDTO> ingredients;

    private int duration;

    private Integer stepNumber;

    private boolean isPreparationStep;

    private StepTypeDTO stepType;

    private List<UstensilDTO> ustensils;

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

    public List<IngredientDTO> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<IngredientDTO> ingredients) {
        this.ingredients = ingredients;
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

    public List<UstensilDTO> getUstensils() {
        return ustensils;
    }

    public void setUstensils(List<UstensilDTO> ustensils) {
        this.ustensils = ustensils;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StepDTO)) return false;
        StepDTO stepDTO = (StepDTO) o;
        return getDuration() == stepDTO.getDuration() && isPreparationStep() == stepDTO.isPreparationStep() && Objects.equals(getId(), stepDTO.getId()) && Objects.equals(getName(), stepDTO.getName()) && Objects.equals(getIngredients(), stepDTO.getIngredients()) && Objects.equals(getStepNumber(), stepDTO.getStepNumber()) && Objects.equals(getStepType(), stepDTO.getStepType()) && Objects.equals(getUstensils(), stepDTO.getUstensils());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getIngredients(), getDuration(), getStepNumber(), isPreparationStep(), getStepType(), getUstensils());
    }

    @Override
    public String toString() {
        return "StepDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", ingredients=" + ingredients +
                ", duration=" + duration +
                ", stepNumber=" + stepNumber +
                ", isPreparationStep=" + isPreparationStep +
                ", stepType=" + stepType +
                ", ustensils=" + ustensils +
                '}';
    }
}
