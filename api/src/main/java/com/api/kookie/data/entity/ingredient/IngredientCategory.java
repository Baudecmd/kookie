package com.api.kookie.data.entity.ingredient;

import javax.persistence.*;
import java.util.Set;

@Entity
public class IngredientCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ingredient_category_id_seq_generator")
    @SequenceGenerator(name = "ingredient_category_id_seq_generator", sequenceName = "ingredient_category_id_seq", allocationSize = 1)
    private Integer id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Ingredient> ingredients;

    public IngredientCategory() {
    }

    public IngredientCategory(int id, String name) {
        this.id = id;
        this.name = name;
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

    public Set<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(Set<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    @Override
    public String toString() {
        return "IngredientCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
