package com.api.kookie.data.entity.Ustensil;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Ustensil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    String nom;

    public Ustensil(String nom) {
        this.nom = nom;
    }

    public Ustensil() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public String toString() {
        return "Ustensil{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }
}
