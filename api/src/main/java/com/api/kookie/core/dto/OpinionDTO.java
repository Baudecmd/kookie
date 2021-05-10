package com.api.kookie.core.dto;

import java.util.Objects;

public class OpinionDTO {

    private Integer id;

    private RecetteDTO recette;

    private UserDTO user;

    private Integer note;

    private String comment;

    public OpinionDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public RecetteDTO getRecette() {
        return recette;
    }

    public void setRecette(RecetteDTO recette) {
        this.recette = recette;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof OpinionDTO)) return false;
        OpinionDTO that = (OpinionDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getRecette(), that.getRecette()) && Objects.equals(getUser(), that.getUser()) && Objects.equals(getNote(), that.getNote()) && Objects.equals(getComment(), that.getComment());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getRecette(), getUser(), getNote(), getComment());
    }

    @Override
    public String toString() {
        return "OpinionDTO{" +
                "id=" + id +
                ", recette=" + recette +
                ", user=" + user +
                ", note=" + note +
                ", comment='" + comment + '\'' +
                '}';
    }
}
