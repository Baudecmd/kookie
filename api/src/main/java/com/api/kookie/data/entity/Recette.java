package com.api.kookie.data.entity;

import com.api.kookie.data.entity.ingredient.Ingredient;
import com.api.kookie.data.entity.ingredient.IngredientCategory;
import com.api.kookie.data.entity.ingredient.IngredientLine;
import jdk.jfr.Category;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "RECETTE", schema = "PUBLIC")
public class Recette {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    @OneToOne(cascade = CascadeType.ALL)
    private Profile createur;

    private String nom;

    @OneToOne
    private RecipeCategory category;

    @OneToMany(cascade = CascadeType.ALL)
    private List<IngredientLine> ingredientLines;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Step> steps;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Opinion> opinions;

    public Recette() {

    }

    public Recette(long id, Profile createur, String nom, RecipeCategory category, List<IngredientLine> ingredientLines, List<Step> steps) {
        this.id = id;
        this.createur = createur;
        this.nom = nom;
        this.category = category;
        this.ingredientLines = ingredientLines;
        this.steps = steps;
    }

    public boolean isThisIngredientCategory(IngredientCategory c){
        for (IngredientLine ig: ingredientLines
             ) {
            if(ig.getIngredient().getCategory()==c)return true;
        }
        return false;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Profile getCreateur() {
        return createur;
    }

    public void setCreateur(Profile createur) {
        this.createur = createur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
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
                ", createur=" + createur +
                ", nom='" + nom + '\'' +
                ", category=" + category +
                ", ingredientLines=" + ingredientLines +
                ", steps=" + steps +
                '}';
    }
}
