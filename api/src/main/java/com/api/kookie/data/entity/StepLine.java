package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class StepLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne
    private IngredientLine ingredientLine;

    private String stepName;

    private Integer duration;

    private Integer stepNumber;

    @OneToOne
    private StepType stepType;

    @OneToMany
    private Set<StepLine> stepLineSet;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public IngredientLine getIngredientLine() {
        return ingredientLine;
    }

    public void setIngredientLine(IngredientLine ingredientLine) {
        this.ingredientLine = ingredientLine;
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

    public StepLine() {
    }

    public StepLine(IngredientLine ingredientLine, String stepName, Integer duration, Integer stepNumber) {
        this.ingredientLine = ingredientLine;
        this.stepName = stepName;
        this.duration = duration;
        this.stepNumber = stepNumber;
    }

    @Override
    public String toString() {
        return "StepLine{" +
                "id=" + id +
                ", ingredientLine=" + ingredientLine +
                ", stepName='" + stepName + '\'' +
                ", duration=" + duration +
                ", stepNumber=" + stepNumber +
                '}';
    }
}
