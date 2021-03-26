package com.api.kookie.core.dto;

import java.util.Objects;

public class RecetteDTO {

    private long id;

    private UserDTO userDTO;

    private String name;

    public RecetteDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UserDTO getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
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
        if (!(o instanceof RecetteDTO)) return false;
        RecetteDTO that = (RecetteDTO) o;
        return getId() == that.getId() && Objects.equals(getUserDTO(), that.getUserDTO()) && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserDTO(), getName());
    }

    @Override
    public String toString() {
        return "RecetteDTO{" +
                "id=" + id +
                ", userDTOId=" + userDTO.getId() +
                ", name='" + name + '\'' +
                '}';
    }
}
