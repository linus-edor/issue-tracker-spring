
package com.spring.test.web.controllers;

import com.spring.test.entities.Issue;
import com.spring.test.entities.User;
import com.spring.test.services.IssueService;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author linus
 *
 */
@Controller
public class AdminController {

    private static IssueService issueService;

    @Autowired
    public void setUssueService(IssueService issueService) {
        AdminController.issueService = issueService;
    }
//    @RequestMapping(value = "/allissuesadminpage")
//    public ModelAndView renderAdmin(@PathVariable Integer id) {
//        ModelAndView modelAndView = new ModelAndView();
//        List<Issue> issues = issueService.findAll();
//        List<User> teamMembers = issueService.getAllUsers();
//        modelAndView.clear();
//        modelAndView.addObject("details", issues);
//        modelAndView.addObject("team", teamMembers);
//        modelAndView.setViewName("/admin");
//        return modelAndView;
//    }

}
