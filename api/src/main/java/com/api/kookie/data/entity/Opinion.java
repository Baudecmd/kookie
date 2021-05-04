package com.api.kookie.data.entity;

import org.hibernate.annotations.Check;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;

@Entity
public class Opinion {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne
    private Recette recette;

    @OneToOne
    private User user;

    //TODO: ADD Interval (0 -> 5)
    private Integer note;

    private String comment;

    public Opinion() {
    }

    public Opinion(Integer id, Recette recette, User user, Integer note, String comment) {
        this.id = id;
        this.recette = recette;
        this.user = user;
        this.note = note;
        this.comment = comment;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
                ", recette=" + recette +
                ", user=" + user +
                ", note=" + note +
                ", comment='" + comment + '\'' +
                '}';
    }

}
