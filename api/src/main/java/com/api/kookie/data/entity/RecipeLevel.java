package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class RecipeLevel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Recipe> recipes;

    public RecipeLevel() {
    }

    public RecipeLevel(Integer id, String name) {
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
        return "RecipeLevel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
