package com.api.kookie.core.dto;

import java.util.Objects;
import java.util.Set;

public class CategoryDTO {

    Set<IngredientDTO> ingredientsDTO;
    private Integer id;
    private String name;

    public CategoryDTO() {
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

    public Set<IngredientDTO> getIngredientsDTO() {
        return ingredientsDTO;
    }

    public void setIngredientsDTO(Set<IngredientDTO> ingredientsDTO) {
        this.ingredientsDTO = ingredientsDTO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CategoryDTO)) return false;
        CategoryDTO that = (CategoryDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getIngredientsDTO(), that.getIngredientsDTO());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getIngredientsDTO());
    }

    @Override
    public String toString() {
        return "CategoryDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
