package com.api.kookie.core.dto;

import java.util.Objects;

public class UstensilDTO {

    private Integer id;

    private String name;

    public UstensilDTO() {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UstensilDTO)) return false;
        UstensilDTO that = (UstensilDTO) o;
        return getId() == that.getId() && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName());
    }

    @Override
    public String toString() {
        return "UstensilDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
