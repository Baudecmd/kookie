package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class RecipeCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recipe_category_id_seq_generator")
    @SequenceGenerator(name = "recipe_category_id_seq_generator", sequenceName = "recipe_category_id_seq", allocationSize = 1)
    private Integer id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Recipe> recipes;

    public RecipeCategory() {
    }

    public RecipeCategory(int id, String name) {
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

    public List<Recipe> getRecipes() {
        return recipes;
    }

    public void setRecipes(List<Recipe> recipes) {
        this.recipes = recipes;
    }

    @Override
    public String toString() {
        return "RecipeCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
