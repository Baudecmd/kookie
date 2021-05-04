package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class RecetteCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Recette> recettes;

    public RecetteCategory() {
    }

    public RecetteCategory(int id, String name) {
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

    public List<Recette> getRecettes() {
        return recettes;
    }

    public void setRecettes(List<Recette> recettes) {
        this.recettes = recettes;
    }

    @Override
    public String toString() {
        return "RecetteCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
