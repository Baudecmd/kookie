package com.api.kookie.core.dto;

import java.util.Objects;

public class RecetteThumbnailDTO {

    private Integer id;

    private String name;

    private Integer note;

    private boolean isFavorite;

    public RecetteThumbnailDTO() {
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

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public boolean getIsFavorite() {
        return isFavorite;
    }

    public void setIsFavorite(boolean favorite) {
        isFavorite = favorite;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteThumbnailDTO)) return false;
        RecetteThumbnailDTO that = (RecetteThumbnailDTO) o;
        return getIsFavorite() == that.getIsFavorite() && Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getNote(), that.getNote());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getNote(), getIsFavorite());
    }

    @Override
    public String toString() {
        return "RecetteThumbnailDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", note=" + note +
                ", isFavorite=" + isFavorite +
                '}';
    }
}
