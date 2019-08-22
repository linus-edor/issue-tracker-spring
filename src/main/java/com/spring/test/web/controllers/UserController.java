/**
 * 
 */
package com.spring.test.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

import com.spring.test.entities.User;
import com.spring.test.services.UserService;
import com.spring.test.web.config.SecurityUser;


@Controller
public class UserController 
{
	private static UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		UserController.userService = userService;
	}
	
	public static User getCurrentUser()
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal instanceof UserDetails) 
	    {
	    	String email = ((UserDetails) principal).getUsername();
	    	User loginUser = userService.findUserByEmail(email);
	    	return new SecurityUser(loginUser);
	    }

	    return null;
	}
	public static int getCurrentUserId()
	{
            if(getCurrentUser() != null){
                User u = getCurrentUser();
                return (userService.findUserByName(u.getName())).getId();
            }
            return -1;
	}
}

