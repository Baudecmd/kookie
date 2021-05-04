package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "RECETTE", schema = "PUBLIC")
public class Recette {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    @OneToOne(cascade = CascadeType.ALL)
    private User createur;

    private String nom;

    @OneToMany(cascade = CascadeType.ALL)
    private List<IngredientLine> ingredientLines;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Step> steps;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Opinion> opinions;

    public Recette() {

    }

    public Recette(User createur, String nom) {
        this.createur = createur;
        this.nom = nom;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getCreateur() {
        return createur;
    }

    public void setCreateur(User createur) {
        this.createur = createur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
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
                '}';
    }
}
