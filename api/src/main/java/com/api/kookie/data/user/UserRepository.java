package com.api.kookie.data.user;

import com.api.kookie.data.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    @Query(" select u from User u " +
            " where u.username = ?1" +
            " and   u.password = ?2")
    User findByIdAndPassword(String username, String password);

    @Query(" select u from User u " +
            " where u.username = ?1")
    User findByUsername(String username);

    Boolean existsUserByUsername(String username);
}
