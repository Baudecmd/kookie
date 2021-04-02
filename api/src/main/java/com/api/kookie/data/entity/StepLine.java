package com.api.kookie.data.entity;

import javax.persistence.*;

@Entity
public class StepLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne
    private Recette recette;

    @ManyToOne
    private Step step;

    public StepLine() {
    }

    public StepLine(Integer id, Recette recette, Step step) {
        this.id = id;
        this.recette = recette;
        this.step = step;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Recette getRecette() {
        return recette;
    }

    public void setRecette(Recette recette) {
        this.recette = recette;
    }

    public Step getStep() {
        return step;
    }

    public void setStep(Step step) {
        this.step = step;
    }

    @Override
    public String toString() {
        return "StepLine{" +
                "id=" + id +
                ", recetteId=" + recette.getId() +
                ", stepId=" + step.getId() +
                '}';
    }
}
