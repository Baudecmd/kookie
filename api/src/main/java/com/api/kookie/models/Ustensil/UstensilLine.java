package com.api.kookie.models.Ustensil;

import javax.persistence.*;

@Entity
public class UstensilLine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @OneToOne
    Ustensil ustensil;

    int nb;

    public UstensilLine() {

    }

    public UstensilLine(Ustensil ustensil, int nb) {
        this.ustensil = ustensil;
        this.nb = nb;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Ustensil getUstensil() {
        return ustensil;
    }

    public void setUstensil(Ustensil ustensil) {
        this.ustensil = ustensil;
    }

    public int getNb() {
        return nb;
    }

    public void setNb(int nb) {
        this.nb = nb;
    }

    @Override
    public String toString() {
        return "UstensilLine{" +
                "id=" + id +
                ", ustensil=" + ustensil +
                ", nb=" + nb +
                '}';
    }
}
