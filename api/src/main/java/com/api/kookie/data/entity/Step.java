package com.api.kookie.data.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Step {

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

    public StepType getStepType() {
        return stepType;
    }

    public void setStepType(StepType stepType) {
        this.stepType = stepType;
    }

    public Step() {
    }

    public Step(IngredientLine ingredientLine, String stepName, Integer duration, Integer stepNumber, StepType stepType) {
        this.ingredientLine = ingredientLine;
        this.stepName = stepName;
        this.duration = duration;
        this.stepNumber = stepNumber;
        this.stepType = stepType;
    }

    @Override
    public String toString() {
        return "Step{" +
                "id=" + id +
                ", ingredientLine=" + ingredientLine +
                ", stepName='" + stepName + '\'' +
                ", duration=" + duration +
                ", stepNumber=" + stepNumber +
                ", stepType=" + stepType +
                '}';
    }
}
