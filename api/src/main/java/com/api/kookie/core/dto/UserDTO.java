package com.api.kookie.core.dto;

import java.util.Objects;

public class UserDTO {

    private long id;

    private String email;

    private String username;

    private String token;

    public UserDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserDTO)) return false;
        UserDTO userDTO = (UserDTO) o;
        return getId() == userDTO.getId() && Objects.equals(getEmail(), userDTO.getEmail()) && Objects.equals(getUsername(), userDTO.getUsername()) && Objects.equals(getToken(), userDTO.getToken());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getEmail(), getUsername(), getToken());
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}
