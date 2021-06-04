package com.api.kookie.core.dto;

import java.util.Objects;

public class RecetteThumbnailDTO {

    private Long id;

    private String name;

    private Integer note;

    private boolean isNotFavorite;

    public RecetteThumbnailDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public boolean isFavorite() {
        return isNotFavorite;
    }

    public void setFavorite(boolean favorite) {
        isNotFavorite = favorite;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteThumbnailDTO)) return false;
        RecetteThumbnailDTO that = (RecetteThumbnailDTO) o;
        return isFavorite() == that.isFavorite() && Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getNote(), that.getNote());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getNote(), isFavorite());
    }

    @Override
    public String toString() {
        return "RecetteThumbnailDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", note=" + note +
                ", isFavorite=" + isNotFavorite +
                '}';
    }
}
