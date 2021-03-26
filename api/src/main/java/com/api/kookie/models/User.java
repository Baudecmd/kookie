package com.api.kookie.models;


import com.api.kookie.models.Ustensil.Ustensil;
import com.api.kookie.models.Ustensil.UstensilLine;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.annotation.security.DeclareRoles;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@DeclareRoles("USER")
@Table(name = "USERS")
public class User {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY) long id;
    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private String username;
    private String password;
    @OneToMany
    private List<UstensilLine> ustensilLineList;

    public User(String email, String username, String password) {
        this.email = email;
        this.username = username;
        this.password = password;
        this.ustensilLineList=new ArrayList<UstensilLine>();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public User() {

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", ustensilLineList=" + ustensilLineList +
                '}';
    }
}
