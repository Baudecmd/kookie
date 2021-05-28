package com.api.kookie.core.dto;

import java.util.List;
import java.util.Objects;

public class RecetteDTO {

    private long id;

    private ProfileDTO profile;

    private String name;

    private CategoryDTO category;

    private List<IngredientLineDTO> ingredientLines;

    private List<StepDTO> stepLines;

    private List<OpinionDTO> opinions;

    public RecetteDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public ProfileDTO getProfile() {
        return profile;
    }

    public void setProfile(ProfileDTO profile) {
        this.profile = profile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<IngredientLineDTO> getIngredientLines() {
        return ingredientLines;
    }

    public void setIngredientLines(List<IngredientLineDTO> ingredientLines) {
        this.ingredientLines = ingredientLines;
    }

    public List<StepDTO> getStepLines() {
        return stepLines;
    }

    public void setStepLines(List<StepDTO> stepDTO) {
        this.stepLines = stepLines;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteDTO)) return false;
        RecetteDTO that = (RecetteDTO) o;
        return getId() == that.getId() && Objects.equals(getProfile(), that.getProfile()) && Objects.equals(getName(), that.getName()) && Objects.equals(getIngredientLines(), that.getIngredientLines()) && Objects.equals(getStepLines(), that.getStepLines());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getProfile(), getName(), getIngredientLines(), getStepLines());
    }


    @Override
    public String toString() {
        return "RecetteDTO{" +
                "id=" + id +
                ", userDTO=" + profile +
                ", name='" + name + '\'' +
                ", ingredientLinesDTO=" + ingredientLines.toString() +
                ", stepLinesDTO=" + stepLines.toString() +
                '}';
    }

}
