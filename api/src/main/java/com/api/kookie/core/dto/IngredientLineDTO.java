package com.api.kookie.core.dto;

import java.util.Objects;

public class IngredientLineDTO {

    private Integer id;

    private IngredientDTO ingredient;

    private Integer quantity;

    public IngredientLineDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public IngredientDTO getIngredient() {
        return ingredient;
    }

    public void setIngredient(IngredientDTO ingredient) {
        this.ingredient = ingredient;
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
        return Objects.equals(getId(), that.getId())  && Objects.equals(getIngredient(), that.getIngredient()) && Objects.equals(getQuantity(), that.getQuantity());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getIngredient(), getQuantity());
    }

    @Override
    public String toString() {
        return "IngredientLineDTO{" +
                "id=" + id +
                ", ingredientDTO=" + ingredient +
                ", quantity=" + quantity +
                '}';
    }
}
