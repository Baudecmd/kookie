package com.api.kookie.data.entity.Utensil;

import javax.persistence.*;

@Entity
public class UtensilLine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @OneToOne
    Utensil utensil;

    int nb;

    public UtensilLine() {

    }

    public UtensilLine(Utensil utensil, int nb) {
        this.utensil = utensil;
        this.nb = nb;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Utensil getUstensil() {
        return utensil;
    }

    public void setUstensil(Utensil utensil) {
        this.utensil = utensil;
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
                ", ustensil=" + utensil +
                ", nb=" + nb +
                '}';
    }
}
