package com.api.kookie.data.entity;

import javax.persistence.*;

@Entity
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;

    private boolean isVegan;

    @OneToOne
    private Category category;

    public Ingredient() {
    }

    public Ingredient(int id, String name, boolean isVegan, Category category) {
        this.id = id;
        this.name = name;
        this.isVegan = isVegan;
        this.category = category;
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

    public boolean isIsVegan() {
        return isVegan;
    }

    public void setIsVegan(boolean vegan) {
        this.isVegan = vegan;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Ingredient{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isVegan=" + isVegan +
                ", categoryId=" + category.getId() +
                '}';
    }
}
