package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class RecipeCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Recette> recipes;

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

    public List<Recette> getRecipes() {
        return recipes;
    }

    public void setRecipes(List<Recette> recipes) {
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
