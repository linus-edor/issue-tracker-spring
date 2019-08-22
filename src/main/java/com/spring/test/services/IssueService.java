/**
 *
 */
package com.spring.test.services;

import com.spring.test.entities.Issue;
import com.spring.test.entities.User;
import com.spring.test.repositories.IssueRepository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class IssueService {

    @Autowired
    private IssueRepository issueRepository;

//    public void IssueService() {
//    }
    public List<Issue> findAll() {
        return issueRepository.findAll();
    }

    public Issue findByMember(User user) {
        return issueRepository.findByMember(user);
    }

    public Issue findIssueById(int id) {
        return issueRepository.findById(id);
    }

    public List<User> getAllUsers() {
        return issueRepository.findAllUsers();
    }
    
    public User findUserByName(String name){
        return issueRepository.findUserByName(name);
    }

    public Issue save(Issue issue) {
        return issueRepository.saveAndFlush(issue);
    }
    
    public User findUserById(int id){
        return issueRepository.findUserById(id);
    }
    
}
