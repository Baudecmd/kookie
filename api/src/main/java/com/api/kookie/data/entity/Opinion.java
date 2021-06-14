package com.api.kookie.data.entity;

import javax.persistence.*;

@Entity
public class Opinion {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne
    private Recipe recipe;

    @OneToOne
    private Profile profile;

    //TODO: ADD Interval (0 -> 5)
    private Integer note;

    private String comment;

    public Opinion() {
    }

    public Opinion(Integer id, Recipe recipe, Profile profile, Integer note, String comment) {
        this.id = id;
        this.recipe = recipe;
        this.profile = profile;
        this.note = note;
        this.comment = comment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Recipe getRecette() {
        return recipe;
    }

    public void setRecette(Recipe recipe) {
        this.recipe = recipe;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Opinion{" +
                "id=" + id +
                ", recette=" + recipe +
                ", profile=" + profile +
                ", note=" + note +
                ", comment='" + comment + '\'' +
                '}';
    }

}
