package com.api.kookie.core.dto;

import java.util.Objects;
import java.util.Set;

public class CategoryDTO {

    Set<IngredientDTO> ingredientDTOs;
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

    public Set<IngredientDTO> getIngredientDTOs() {
        return ingredientDTOs;
    }

    public void setIngredientDTOs(Set<IngredientDTO> ingredientDTOs) {
        this.ingredientDTOs = ingredientDTOs;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CategoryDTO)) return false;
        CategoryDTO that = (CategoryDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getIngredientDTOs(), that.getIngredientDTOs());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getIngredientDTOs());
    }

    @Override
    public String toString() {
        return "CategoryDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", ingredientDTOs=" + ingredientDTOs +
                '}';
    }
}
