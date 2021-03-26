package com.api.kookie.repositories;

import com.api.kookie.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    @Query(" select u from User u " +
            " where u.username = ?1"+
            " and   u.password = ?2")
    User findByIdAndPassword(String username,String password);

    @Query(" select u from User u " +
            " where u.username = ?1"+
            " or   u.email = ?2")
    List<User> findByUsernameOrEmail(String username, String email);

    @Query(" select u from User u " +
            " where u.username = ?1")
    User findByUsername(String username);
}
