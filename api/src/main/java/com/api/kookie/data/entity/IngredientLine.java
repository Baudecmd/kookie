package com.api.kookie.data.entity;

import javax.persistence.*;

@Entity
public class IngredientLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne
    private Recette recette;

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

    public Recette getRecette() {
        return recette;
    }

    public void setRecette(Recette recette) {
        this.recette = recette;
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
                ", recetteId=" + recette.getId() +
                ", ingredientId=" + ingredient.getId() +
                ", quantity=" + quantity +
                '}';
    }
}
