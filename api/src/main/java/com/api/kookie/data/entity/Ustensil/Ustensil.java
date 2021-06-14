package com.api.kookie.data.entity.Ustensil;

import com.api.kookie.data.entity.Step;

import javax.persistence.*;
import java.util.List;

@Entity
public class Ustensil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nom;

    @ManyToMany(cascade = CascadeType.ALL)
    private List<Step> steps;

    public Ustensil(String nom) {
        this.nom = nom;
    }

    public Ustensil() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }

    @Override
    public String toString() {
        return "Ustensil{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }
}
