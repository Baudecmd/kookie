package com.api.kookie.core.dto;

import java.util.Objects;

public class CredentialDTO {

    private String username;

    private String password;

    public CredentialDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CredentialDTO)) return false;
        CredentialDTO that = (CredentialDTO) o;
        return Objects.equals(getUsername(), that.getUsername()) && Objects.equals(getPassword(), that.getPassword());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUsername(), getPassword());
    }

    @Override
    public String toString() {
        return "CredentialDTO{" +
                "username='" + username + '\'' +
                '}';
    }
}
