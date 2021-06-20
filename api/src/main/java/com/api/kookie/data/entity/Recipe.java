package com.api.kookie.data.entity;

import com.api.kookie.data.entity.ingredient.IngredientCategory;
import com.api.kookie.data.entity.ingredient.IngredientLine;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Recipe", schema = "PUBLIC")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recipe_id_seq_generator")
    @SequenceGenerator(name = "recipe_id_seq_generator", sequenceName = "recipe_id_seq", allocationSize = 1)
    private Integer id;

    @ManyToOne
    private Profile creator;

    private String name;

    private String image;

    @ManyToOne
    private RecipeCategory category;

    @OneToMany(cascade = CascadeType.ALL)
    private List<IngredientLine> ingredientLines;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Step> steps;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Opinion> opinions;

    public Recipe() {

    }

    public Recipe(Integer id, Profile creator, String name, RecipeCategory category, List<IngredientLine> ingredientLines, List<Step> steps) {
        this.id = id;
        this.creator = creator;
        this.name = name;
        this.category = category;
        this.ingredientLines = ingredientLines;
        this.steps = steps;
    }

    public boolean isThisIngredientCategory(IngredientCategory c) {
        for (IngredientLine ig : ingredientLines
        ) {
            if (ig.getIngredient().getCategory() == c) return true;
        }
        return false;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Profile getCreator() {
        return creator;
    }

    public void setCreator(Profile creator) {
        this.creator = creator;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public RecipeCategory getCategory() {
        return category;
    }

    public void setCategory(RecipeCategory category) {
        this.category = category;
    }

    public List<IngredientLine> getIngredientLines() {
        return ingredientLines;
    }

    public void setIngredientLines(List<IngredientLine> ingredientLines) {
        this.ingredientLines = ingredientLines;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }

    public List<Opinion> getOpinions() {
        return opinions;
    }

    public void setOpinions(List<Opinion> opinions) {
        this.opinions = opinions;
    }

    @Override
    public String toString() {
        return "Recette{" +
                "id=" + id +
                ", creator=" + creator +
                ", name='" + name + '\'' +
                ", category=" + category +
                ", ingredientLines=" + ingredientLines +
                ", steps=" + steps +
                '}';
    }
}
