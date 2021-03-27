package com.api.kookie.models;

import com.api.kookie.data.entity.IngredientLine;

import javax.persistence.*;
import java.util.Set;

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
    private Set<IngredientLine> ingredientLines;

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

    public Set<IngredientLine> getIngredientLines() {
        return ingredientLines;
    }

    public void setIngredientLines(Set<IngredientLine> ingredientLines) {
        this.ingredientLines = ingredientLines;
    }
}
