package com.spring.test.repositories;

import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spring.test.entities.User;

public interface UserRepository extends JpaRepository<User, Serializable> {

    @Query("select u from User u where u.email=?1 and u.password=?2")
    User login(String email, String password);

    User findByEmailAndPassword(String email, String password);

    User findUserByEmail(String email);

    @Override
    @Query("select u from User u")
    List<User> findAll();

    @Query("select u from User u where u.name=?1")
    User findUserByName(String name);
}
