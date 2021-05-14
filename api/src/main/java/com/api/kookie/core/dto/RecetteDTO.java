package com.api.kookie.core.dto;

import com.api.kookie.data.entity.Opinion;
import com.api.kookie.data.entity.RecipeCategory;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import java.util.List;
import java.util.Objects;

public class RecetteDTO {

    private long id;

    private UserDTO userDTO;

    private String name;

    private CategoryDTO category;

    private List<IngredientLineDTO> ingredientLinesDTO;

    private List<StepDTO> stepLinesDTO;

    private List<OpinionDTO> opinions;

    public RecetteDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UserDTO getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<IngredientLineDTO> getIngredientLinesDTO() {
        return ingredientLinesDTO;
    }

    public void setIngredientLinesDTO(List<IngredientLineDTO> ingredientLinesDTO) {
        this.ingredientLinesDTO = ingredientLinesDTO;
    }

    public List<StepDTO> getStepLinesDTO() {
        return stepLinesDTO;
    }

    public void setStepLinesDTO(List<StepDTO> stepDTO) {
        this.stepLinesDTO = stepLinesDTO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteDTO)) return false;
        RecetteDTO that = (RecetteDTO) o;
        return getId() == that.getId() && Objects.equals(getUserDTO(), that.getUserDTO()) && Objects.equals(getName(), that.getName()) && Objects.equals(getIngredientLinesDTO(), that.getIngredientLinesDTO()) && Objects.equals(getStepLinesDTO(), that.getStepLinesDTO());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserDTO(), getName(), getIngredientLinesDTO(), getStepLinesDTO());
    }


    @Override
    public String toString() {
        return "RecetteDTO{" +
                "id=" + id +
                ", userDTO=" + userDTO +
                ", name='" + name + '\'' +
                ", ingredientLinesDTO=" + ingredientLinesDTO.toString() +
                ", stepLinesDTO=" + stepLinesDTO.toString() +
                '}';
    }

}
