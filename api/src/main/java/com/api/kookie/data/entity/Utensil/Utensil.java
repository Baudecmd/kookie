package com.api.kookie.data.entity.Utensil;

import com.api.kookie.data.entity.Step;

import javax.persistence.*;
import java.util.List;

@Entity
public class Utensil {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "utensil_id_seq_generator")
    @SequenceGenerator(name = "utensil_id_seq_generator", sequenceName = "utensil_line_id_seq", allocationSize = 1)
    private Integer id;

    private String name;

    @ManyToMany(mappedBy = "utensils")
    private List<Step> steps;

    public Utensil(String name) {
        this.name = name;
    }

    public Utensil() {

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
                ", name='" + name + '\'' +
                '}';
    }
}
