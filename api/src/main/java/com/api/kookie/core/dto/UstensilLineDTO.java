package com.api.kookie.core.dto;

import java.util.Objects;

public class UstensilLineDTO {

    private long id;

    private UstensilDTO ustensil;

    private int quantity;

    public UstensilLineDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UstensilDTO getUstensil() {
        return ustensil;
    }

    public void setUstensil(UstensilDTO ustensil) {
        this.ustensil = ustensil;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UstensilLineDTO)) return false;
        UstensilLineDTO that = (UstensilLineDTO) o;
        return getId() == that.getId() && getQuantity() == that.getQuantity() && Objects.equals(getUstensil(), that.getUstensil());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUstensil(), getQuantity());
    }

    @Override
    public String toString() {
        return "UstensilLineDTO{" +
                "id=" + id +
                ", ustensil=" + ustensil +
                ", nb=" + quantity +
                '}';
    }
}
