package com.spring.test.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.entities.Issue;

@Repository
@Transactional
public class JpaIssueDaoImpl implements IssueDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    @Transactional(readOnly = true)
    public List<Issue> findAll() {
        return em.createQuery("select i from Issue i", Issue.class).getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public Issue findById(int id) {
        return em.find(Issue.class, id);
    }

    @Override
    public Issue create(Issue issue) {
        if (issue.getId() <= 0) {
            em.persist(issue);
        } else {
            issue = em.merge(issue);
        }
        return issue;
    }

    @Override
        public Issue delete(int id) {
        return null;
    }

    @Override
    public Issue save(Issue issue) {
        return null;
    }

}
