package com.api.kookie.models;

import javax.annotation.security.DeclareRoles;
import javax.persistence.*;

@Entity
@Table(name = "RECETTE", schema = "PUBLIC")
public class Recette {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY) long id;
    @OneToOne(cascade= CascadeType.ALL)
    private User createur;

    private String nom;

    public Recette() {

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

    public Recette(User createur, String nom) {
        this.createur = createur;
        this.nom = nom;
    }
}
