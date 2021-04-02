package com.api.kookie.data.entity;


import javax.persistence.*;
import java.util.Set;

@Entity
public class Step {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    private String description;

    private Integer duration;

    @OneToMany
    private Set<StepLine> stepLines;

    public Step() {
    }

    public Step(Integer id, String name, String description, Integer duration) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.duration = duration;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Set<StepLine> getStepLines() {
        return stepLines;
    }

    public void setStepLines(Set<StepLine> stepLines) {
        this.stepLines = stepLines;
    }

    @Override
    public String toString() {
        return "Step{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", duration=" + duration +
                '}';
    }
}
