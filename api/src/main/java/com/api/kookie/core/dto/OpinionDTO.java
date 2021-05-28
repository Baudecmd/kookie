package com.api.kookie.core.dto;

import java.util.Objects;

public class OpinionDTO {

    private Integer id;

    private RecetteDTO recette;

    private ProfileDTO profile;

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

    public ProfileDTO getProfile() {
        return profile;
    }

    public void setProfile(ProfileDTO profile) {
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof OpinionDTO)) return false;
        OpinionDTO that = (OpinionDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getRecette(), that.getRecette()) && Objects.equals(getProfile(), that.getProfile()) && Objects.equals(getNote(), that.getNote()) && Objects.equals(getComment(), that.getComment());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getRecette(), getProfile(), getNote(), getComment());
    }

    @Override
    public String toString() {
        return "OpinionDTO{" +
                "id=" + id +
                ", recette=" + recette +
                ", profile=" + profile +
                ", note=" + note +
                ", comment='" + comment + '\'' +
                '}';
    }
}
