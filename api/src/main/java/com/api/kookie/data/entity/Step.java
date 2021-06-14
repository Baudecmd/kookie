package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Utensil.Utensil;
import com.api.kookie.data.entity.ingredient.Ingredient;

import javax.persistence.*;
import java.util.List;

@Entity
public class Step {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "step_id_seq_generator")
    @SequenceGenerator(name = "step_id_seq_generator", sequenceName = "step_id_seq", allocationSize = 1)
    private Integer id;

    @ManyToMany
    private List<Ingredient> ingredients;

    private String stepName;

    private Integer duration;

    private Integer stepNumber;

    @OneToOne
    private StepType stepType;

    @ManyToMany
    private List<Utensil> utensils;

    public Step() {
    }

    public Step(Integer id, List<Ingredient> ingredients, String stepName, Integer duration, Integer stepNumber, StepType stepType, List<Utensil> utensils) {
        this.id = id;
        this.ingredients = ingredients;
        this.stepName = stepName;
        this.duration = duration;
        this.stepNumber = stepNumber;
        this.stepType = stepType;
        this.utensils = utensils;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public String getStepName() {
        return stepName;
    }

    public void setStepName(String stepName) {
        this.stepName = stepName;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getStepNumber() {
        return stepNumber;
    }

    public void setStepNumber(Integer stepNumber) {
        this.stepNumber = stepNumber;
    }

    public StepType getStepType() {
        return stepType;
    }

    public void setStepType(StepType stepType) {
        this.stepType = stepType;
    }

    public List<Utensil> getUstensils() {
        return utensils;
    }

    public void setUstensils(List<Utensil> utensils) {
        this.utensils = utensils;
    }

    @Override
    public String toString() {
        return "Step{" +
                "id=" + id +
                ", ingredients=" + ingredients +
                ", stepName='" + stepName + '\'' +
                ", duration=" + duration +
                ", stepNumber=" + stepNumber +
                ", stepType=" + stepType +
                ", ustensils=" + utensils +
                '}';
    }
}
