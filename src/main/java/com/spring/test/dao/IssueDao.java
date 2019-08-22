/**
 * 
 */
package com.spring.test.dao;

import java.util.List;

import com.spring.test.entities.Issue;

/**
 * @author katsi02
 *
 */
public interface IssueDao {

	public List<Issue> findAll();
        	
	public Issue create(Issue user);
	
	public Issue findById(int id);
        
        public Issue delete(int id);
        
        public Issue save(Issue issue);

}
