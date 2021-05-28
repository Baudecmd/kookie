package com.api.kookie.data.entity;

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

    @OneToMany
    private List<Opinion> opinions;

    public Profile() {
    }

    public Profile(Integer id, User user, String firstName, String lastName, List<Recette> favoriteRecettes, List<Recette> createdRecettes, List<UstensilLine> ustensilLines, List<Opinion> opinions) {
        this.id = id;
        this.user = user;
        this.firstName = firstName;
        this.lastName = lastName;
        this.favoriteRecettes = favoriteRecettes;
        this.createdRecettes = createdRecettes;
        this.ustensilLines = ustensilLines;
        this.opinions = opinions;
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

    public List<UstensilLine> getUstensilLines() {
        return ustensilLines;
    }

    public void setUstensilLines(List<UstensilLine> ustensilLines) {
        this.ustensilLines = ustensilLines;
    }

    public List<Opinion> getOpinions() {
        return opinions;
    }

    public void setOpinions(List<Opinion> opinions) {
        this.opinions = opinions;
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
                ", ustensilLines=" + ustensilLines +
                ", opinions=" + opinions +
                '}';
    }
}
