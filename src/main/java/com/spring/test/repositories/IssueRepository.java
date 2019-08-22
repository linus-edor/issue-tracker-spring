package com.spring.test.repositories;

import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spring.test.entities.Issue;
import com.spring.test.entities.User;

public interface IssueRepository extends JpaRepository<Issue, Serializable> {

    @Query("select iss from Issue iss where iss.id=?1")
    Issue findById(int id);
    
    List<Issue> findAll();
    
    @Query("select u from User u")
    List<User> findAllUsers();

    @Query("select u from User u where u.name=?1")
    User findUserByName(String name);
    
@Query("select iss from Issue iss where iss.assignedTo=?1")
    Issue findByMember(User user);

    @Query("select u from User u where u.id=?1")
    User findUserById(int id);

}
