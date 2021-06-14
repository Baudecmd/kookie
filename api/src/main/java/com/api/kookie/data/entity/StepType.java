package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Utensil.Utensil;

import javax.persistence.*;
import java.util.List;

@Entity
public class StepType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    @OneToMany
    private List<Utensil> utensils;

    public StepType() {
    }

    public StepType(String name, List<Utensil> utensils) {
        this.name = name;
        this.utensils = utensils;
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

    public List<Utensil> getUstensils() {
        return utensils;
    }

    public void setUstensils(List<Utensil> utensils) {
        this.utensils = utensils;
    }
}
