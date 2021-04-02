package com.api.kookie.core.dto;


import java.util.Objects;

public class StepLineDTO {

    private Integer id;

    private RecetteDTO recetteDTO;

    private StepDTO stepDTO;

    public StepLineDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public RecetteDTO getRecetteDTO() {
        return recetteDTO;
    }

    public void setRecetteDTO(RecetteDTO recetteDTO) {
        this.recetteDTO = recetteDTO;
    }

    public StepDTO getStepDTO() {
        return stepDTO;
    }

    public void setStepDTO(StepDTO stepDTO) {
        this.stepDTO = stepDTO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StepLineDTO)) return false;
        StepLineDTO that = (StepLineDTO) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getRecetteDTO(), that.getRecetteDTO()) && Objects.equals(getStepDTO(), that.getStepDTO());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getRecetteDTO(), getStepDTO());
    }

    @Override
    public String toString() {
        return "StepLineDTO{" +
                "id=" + id +
                ", recetteDTOId=" + recetteDTO.getId() +
                ", stepDTOId=" + stepDTO.getId() +
                '}';
    }
}
