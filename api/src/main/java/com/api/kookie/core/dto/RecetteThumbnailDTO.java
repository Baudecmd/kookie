package com.api.kookie.core.dto;

import java.util.Objects;

public class RecetteThumbnailDTO {

    private String name;

    private Integer note;

    private boolean isFavorite;

    public RecetteThumbnailDTO() {
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

    public boolean isFavorite() {
        return isFavorite;
    }

    public void setFavorite(boolean favorite) {
        isFavorite = favorite;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteThumbnailDTO)) return false;
        RecetteThumbnailDTO that = (RecetteThumbnailDTO) o;
        return isFavorite() == that.isFavorite() && Objects.equals(getName(), that.getName()) && Objects.equals(getNote(), that.getNote());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getNote(), isFavorite());
    }

    @Override
    public String toString() {
        return "RecetteThumbnailDTO{" +
                "name='" + name + '\'' +
                ", note=" + note +
                ", isFavorite=" + isFavorite +
                '}';
    }
}
