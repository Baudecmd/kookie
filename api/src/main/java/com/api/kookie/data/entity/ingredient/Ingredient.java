package com.api.kookie.data.entity.ingredient;

import com.api.kookie.data.entity.Step;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ingredient_id_seq_generator")
    @SequenceGenerator(name = "ingredient_id_seq_generator", sequenceName = "ingredient_id_seq", allocationSize = 1)
    private Integer id;

    private String name;

    private boolean isVegan;

    @OneToOne
    private IngredientCategory ingredientCategory;

    @ManyToMany(mappedBy = "ingredients")
    private List<Step> steps;

    public Ingredient() {
    }

    public Ingredient(int id, String name, boolean isVegan, IngredientCategory ingredientCategory) {
        this.id = id;
        this.name = name;
        this.isVegan = isVegan;
        this.ingredientCategory = ingredientCategory;
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

    public boolean isVegan() {
        return isVegan;
    }

    public void setVegan(boolean vegan) {
        isVegan = vegan;
    }

    public boolean isIsVegan() {
        return isVegan;
    }

    public void setIsVegan(boolean vegan) {
        this.isVegan = vegan;
    }

    public IngredientCategory getCategory() {
        return ingredientCategory;
    }

    public void setCategory(IngredientCategory ingredientCategory) {
        this.ingredientCategory = ingredientCategory;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }

    @Override
    public String toString() {
        return "Ingredient{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isVegan=" + isVegan +
                ", categoryId=" + ingredientCategory.getId() +
                '}';
    }
}
