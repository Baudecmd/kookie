package com.api.kookie.core.dto;

import java.util.Objects;

public class IngredientLineDTO {

    private Integer id;

    private IngredientDTO ingredientDTO;

    private Integer quantity;

    public IngredientLineDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public IngredientDTO getIngredientDTO() {
        return ingredientDTO;
    }

    public void setIngredientDTO(IngredientDTO ingredientDTO) {
        this.ingredientDTO = ingredientDTO;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof IngredientLineDTO)) return false;
        IngredientLineDTO that = (IngredientLineDTO) o;
        return Objects.equals(getId(), that.getId())  && Objects.equals(getIngredientDTO(), that.getIngredientDTO()) && Objects.equals(getQuantity(), that.getQuantity());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getIngredientDTO(), getQuantity());
    }

    @Override
    public String toString() {
        return "IngredientLineDTO{" +
                "id=" + id +
                ", ingredientDTO=" + ingredientDTO.toString() +
                ", quantity=" + quantity +
                '}';
    }
}
