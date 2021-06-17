package com.api.kookie.core.dto;

import java.util.List;
import java.util.Objects;

public class RecetteDTO {

    private Integer id;

    private ProfileDTO profile;

    private String name;

    private String image;

    private Boolean isFavorite;

    private CategoryDTO category;

    private List<IngredientLineDTO> ingredientLines;

    private List<StepDTO> steps;

    private List<OpinionDTO> opinions;

    public RecetteDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ProfileDTO getProfile() {
        return profile;
    }

    public void setProfile(ProfileDTO profile) {
        this.profile = profile;
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

    public Boolean getIsFavorite() {
        return isFavorite;
    }

    public void setIsFavorite(Boolean favorite) {
        isFavorite = favorite;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public List<IngredientLineDTO> getIngredientLines() {
        return ingredientLines;
    }

    public void setIngredientLines(List<IngredientLineDTO> ingredientLines) {
        this.ingredientLines = ingredientLines;
    }

    public List<StepDTO> getSteps() {
        return steps;
    }

    public void setSteps(List<StepDTO> steps) {
        this.steps = steps;
    }

    public List<OpinionDTO> getOpinions() {
        return opinions;
    }

    public void setOpinions(List<OpinionDTO> opinions) {
        this.opinions = opinions;
    }


    @Override
    public String toString() {
        return "RecetteDTO{" +
                "id=" + id +
                ", profile=" + profile.toString() +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", isFavorite=" + isFavorite +
                ", category=" + category.toString() +
                ", ingredientLines=" + ingredientLines.toString() +
                ", steps=" + steps.toString() +
                ", opinions=" + opinions +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RecetteDTO)) return false;
        RecetteDTO that = (RecetteDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getProfile(), that.getProfile()) && Objects.equals(getName(), that.getName()) && Objects.equals(getImage(), that.getImage()) && Objects.equals(getIsFavorite(), that.getIsFavorite()) && Objects.equals(getCategory(), that.getCategory()) && Objects.equals(getIngredientLines(), that.getIngredientLines()) && Objects.equals(getSteps(), that.getSteps()) && Objects.equals(getOpinions(), that.getOpinions());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getProfile(), getName(), getImage(), getIsFavorite(), getCategory(), getIngredientLines(), getSteps(), getOpinions());
    }

}
