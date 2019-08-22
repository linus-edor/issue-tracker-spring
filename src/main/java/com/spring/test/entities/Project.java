package com.spring.test.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author linus
 */
@Entity
@Table(name = "project")
public class Project implements Serializable{

    private static final long serialVersionUID = -5527566243787676042L;

    @Id
    @GeneratedValue
    @Column(name = "ID")
    private Long id;

    @OneToMany
    public List<Issue> issues = new ArrayList<Issue>();

    @OneToMany
    public List<User> members = new ArrayList<User>();

    @Column(name = "projectName")
    private String projectName;

    public void Project(String name, Issue issue) {
        projectName = name;
        issues.add(issue);
    }
    
    public void Project(String name, User member){
        projectName=name;
        members.add(member);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setProjectName(String name) {
        projectName = name;
    }

    public String getProjectName() {
        return projectName;
    }

}
