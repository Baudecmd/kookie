package com.api.kookie.core.dto;

import java.util.Objects;

public class RecetteThumbnailDTO {

    private Integer id;

    private String name;

    private String image;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public void setIsFavorite(boolean isFavorite) {
        this.isFavorite = isFavorite;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteThumbnailDTO)) return false;
        RecetteThumbnailDTO that = (RecetteThumbnailDTO) o;
        return isFavorite == that.isFavorite && Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getImage(), that.getImage()) && Objects.equals(getNote(), that.getNote());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getImage(), getNote(), isFavorite);
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
