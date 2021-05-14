package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Ustensil.Ustensil;
import com.api.kookie.data.entity.Ustensil.UstensilLine;

import javax.persistence.*;
import java.util.List;

@Entity
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne(cascade = CascadeType.ALL)
    private User user;

    private String firstName;

    private String lastName;

    @OneToMany
    private List<Recette> favoriteRecettes;

    @OneToMany
    private List<Recette> createdRecettes;

    @OneToMany
    private List<UstensilLine> ustensilLines;

    public Integer getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public List<Recette> getFavoriteRecettes() {
        return favoriteRecettes;
    }

    public List<Recette> getCreatedRecettes() {
        return createdRecettes;
    }

    public List<UstensilLine> getUstensilLines() {
        return ustensilLines;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setFavoriteRecettes(List<Recette> favoriteRecettes) {
        this.favoriteRecettes = favoriteRecettes;
    }

    public void setCreatedRecettes(List<Recette> createdRecettes) {
        this.createdRecettes = createdRecettes;
    }

    public void setUstensilLines(List<UstensilLine> ustensilLines) {
        this.ustensilLines = ustensilLines;
    }

    public Profile() {
    }

    public Profile(Integer id, User user, String firstName, String lastName, List<Recette> favoriteRecettes, List<Recette> createdRecettes, List<UstensilLine> ustensilLines) {
        this.id = id;
        this.user = user;
        this.firstName = firstName;
        this.lastName = lastName;
        this.favoriteRecettes = favoriteRecettes;
        this.createdRecettes = createdRecettes;
        this.ustensilLines = ustensilLines;
    }
}
