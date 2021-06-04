package com.api.kookie.data.entity.ingredient;

import com.api.kookie.data.entity.Recette;

import javax.persistence.*;

@Entity
public class IngredientLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne
    private Ingredient ingredient;

    private Integer quantity;

    public IngredientLine() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "IngredientLine{" +
                "id=" + id +
                ", ingredientId=" + ingredient.getId() +
                ", quantity=" + quantity +
                '}';
    }
}
