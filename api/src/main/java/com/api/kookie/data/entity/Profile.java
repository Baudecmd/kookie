package com.api.kookie.data.entity;

import com.api.kookie.data.entity.Utensil.UtensilLine;

import javax.persistence.*;
import java.util.List;

@Entity
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "profile_id_seq_generator")
    @SequenceGenerator(name = "profile_id_seq_generator", sequenceName = "profile_id_seq", allocationSize = 1)
    private Integer id;

    @OneToOne(cascade = CascadeType.ALL)
    private User user;

    private String firstName;

    private String lastName;

    @OneToMany
    private List<Recipe> favoriteRecipes;

    @OneToMany
    private List<Recipe> createdRecipes;

    @OneToMany
    private List<UtensilLine> utensilLines;

    @OneToMany
    private List<Opinion> opinions;

    public Profile() {
    }

    public Profile(Integer id, User user, String firstName, String lastName, List<Recipe> favoriteRecipes, List<Recipe> createdRecipes, List<UtensilLine> utensilLines, List<Opinion> opinions) {
        this.id = id;
        this.user = user;
        this.firstName = firstName;
        this.lastName = lastName;
        this.favoriteRecipes = favoriteRecipes;
        this.createdRecipes = createdRecipes;
        this.utensilLines = utensilLines;
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

    public List<Recipe> getFavoriteRecettes() {
        return favoriteRecipes;
    }

    public void setFavoriteRecettes(List<Recipe> favoriteRecipes) {
        this.favoriteRecipes = favoriteRecipes;
    }

    public List<Recipe> getCreatedRecettes() {
        return createdRecipes;
    }

    public void setCreatedRecettes(List<Recipe> createdRecipes) {
        this.createdRecipes = createdRecipes;
    }

    public List<UtensilLine> getUstensilLines() {
        return utensilLines;
    }

    public void setUstensilLines(List<UtensilLine> utensilLines) {
        this.utensilLines = utensilLines;
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
                ", favoriteRecettes=" + favoriteRecipes +
                ", createdRecettes=" + createdRecipes +
                ", ustensilLines=" + utensilLines +
                ", opinions=" + opinions +
                '}';
    }
}
