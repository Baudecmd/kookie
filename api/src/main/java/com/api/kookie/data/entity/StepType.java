package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Ustensil.Ustensil;

import javax.persistence.*;
import java.util.List;

@Entity
public class StepType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    @OneToMany
    private List<Ustensil> ustensils;

    public StepType() {
    }

    public StepType(String name, List<Ustensil> ustensils) {
        this.name = name;
        this.ustensils = ustensils;
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

    public List<Ustensil> getUstensils() {
        return ustensils;
    }

    public void setUstensils(List<Ustensil> ustensils) {
        this.ustensils = ustensils;
    }
}
