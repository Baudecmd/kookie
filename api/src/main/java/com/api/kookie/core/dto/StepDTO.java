package com.api.kookie.core.dto;

import com.api.kookie.data.entity.StepType;
import com.api.kookie.data.entity.ingredient.IngredientLine;

import javax.persistence.OneToOne;
import java.util.Objects;

public class StepDTO {

    private Integer id;

    private String name;

    private String description;

    private IngredientLineDTO ingredientLine;

    private int duration;

    private Integer stepNumber;

    private StepType stepType;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StepDTO)) return false;
        StepDTO stepDTO = (StepDTO) o;
        return getDuration() == stepDTO.getDuration() && Objects.equals(getId(), stepDTO.getId()) && Objects.equals(getName(), stepDTO.getName()) && Objects.equals(getDescription(), stepDTO.getDescription());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getDescription(), getDuration());
    }

    @Override
    public String toString() {
        return "StepDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", duration=" + duration +
                '}';
    }
}
