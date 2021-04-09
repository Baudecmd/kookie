package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Ustensil.Ustensil;

import javax.persistence.*;
import java.util.List;

@Entity
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne
    private User user;

    private String firstName;

    private String lastName;

    @OneToMany
    private List<Recette> favoriteRecettes;

    @OneToMany
    private List<Recette> createdRecettes;

    @OneToMany
    private List<Ustensil> ustensil;

    public Profile() {
    }

    public Profile(Integer id, User user, String firstName, String lastName, List<Recette> favoriteRecettes, List<Recette> createdRecettes, List<Ustensil> ustensil) {
        this.id = id;
        this.user = user;
        this.firstName = firstName;
        this.lastName = lastName;
        this.favoriteRecettes = favoriteRecettes;
        this.createdRecettes = createdRecettes;
        this.ustensil = ustensil;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<Recette> getFavoriteRecettes() {
        return favoriteRecettes;
    }

    public void setFavoriteRecettes(List<Recette> favoriteRecettes) {
        this.favoriteRecettes = favoriteRecettes;
    }

    public List<Recette> getCreatedRecettes() {
        return createdRecettes;
    }

    public void setCreatedRecettes(List<Recette> createdRecettes) {
        this.createdRecettes = createdRecettes;
    }

    public List<Ustensil> getUstensil() {
        return ustensil;
    }

    public void setUstensil(List<Ustensil> ustensil) {
        this.ustensil = ustensil;
    }

    @Override
    public String toString() {
        return "Profile{" +
                "id=" + id +
                ", user=" + user +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", favoriteRecettes=" + favoriteRecettes +
                ", createdRecettes=" + createdRecettes +
                ", ustensil=" + ustensil +
                '}';
    }
}
