/**
 *
 * @author linus
 */
package com.spring.test.web.controllers;

import com.spring.test.entities.Issue;
import com.spring.test.entities.User;
import com.spring.test.services.IssueService;

//import com.mysql.jdbc.Util;
//import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author linus
 *
 */
@Controller
public class IssueController {

    private static IssueService issueService;

    @Autowired
    public void setUssueService(IssueService issueService) {
        IssueController.issueService = issueService;
    }

    @RequestMapping(value = "/issues")
    public static ModelAndView getAllIssues() {
        List<Issue> issues = issueService.findAll();
        ModelAndView modelAndView = new ModelAndView("issues");
        modelAndView.addObject("issues", issues);
        return modelAndView;
    }

    @RequestMapping(value = "/issuedetails/{id}")
    public ModelAndView viewIssueDetails(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        Issue issue = issueService.findIssueById(id);
        List<User> teamMembers = issueService.getAllUsers();
        modelAndView.clear();
        modelAndView.addObject("details", issue);
        modelAndView.addObject("team", teamMembers);
        modelAndView.setViewName("issuedetail");
        return modelAndView;
    }

    @RequestMapping(value = "/assignIssue", method = RequestMethod.POST)
    public static ModelAndView assignIssue(@RequestParam("issue") int i, @RequestParam("member") int m) {
        User u = new User();
        u.setId(m);
        Issue iss = issueService.findIssueById(i);
        iss.setAssignedTo(u);
        issueService.save(iss);
        ModelAndView modelAndView = new ModelAndView();
        List<User> teamMembers = issueService.getAllUsers();
        modelAndView.clear();
        modelAndView.addObject("details", iss);
        modelAndView.addObject("team", teamMembers);
        modelAndView.setViewName("issuedetail");
        return modelAndView;
    }

//    @RequestMapping(value = "/createNewIssue", method = RequestMethod.GET)
//    public String newIssueForm(Model model) {
//        model.addAttribute("issuemodel", new Issue());
//        return "createIssue";
//    }
    @RequestMapping(value = "/createNewIssue", method = RequestMethod.GET)
    public ModelAndView newIssueForm() {
        ModelAndView modelAndView = new ModelAndView("createIssue");
        modelAndView.addObject("issuemodel", new Issue());
        return modelAndView;
    }

    @RequestMapping(value = "/createIssue", method = RequestMethod.POST)
    public ModelAndView saveIssue(@RequestParam("summary") String sum, @RequestParam("fulldesc") String full, @RequestParam("identifiedBy") String iden) {
        User u = issueService.findUserByName(iden);
        Issue iss = new Issue();
        iss.setIdentifiedBy(u);
        iss.setSummary(sum);
        iss.setFullDetails(full);
        iss.setDateIdentified(new java.sql.Date(System.currentTimeMillis()));
        iss.setStatus(true);
//        iss.setResolutionDate(null);
//        iss.setAssignedTo(null);
//        iss.setClosingComments(null);
        issueService.save(iss);
        ModelAndView modelAndView = new ModelAndView();
        List<User> teamMembers = issueService.getAllUsers();
        modelAndView.clear();
        modelAndView.addObject("details", iss);
        modelAndView.addObject("team", teamMembers);
        modelAndView.setViewName("issuedetail");
        return modelAndView;
    }

    @RequestMapping(value = "/getmyassigment/{id}")
    public static ModelAndView myAssigment(@PathVariable int id) {
        User u = issueService.findUserById(id);
        Issue iss = issueService.findByMember(u);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.clear();
        modelAndView.addObject("details", iss);
        modelAndView.setViewName("assignment");
        return modelAndView;
    }

    @RequestMapping(value = "/closeAssigment/{id}")
    public static ModelAndView closeIssue(@RequestParam("close") boolean close, @RequestParam("comment") String comment, @PathVariable int id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.clear();
        modelAndView.setViewName("assignment");
        if (close == true) {
            Issue iss = issueService.findIssueById(id);
            iss.setClosingComments(comment);
            iss.setStatus(close);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/allissuespagemaster")
    public ModelAndView allIssuesPage() {
        ModelAndView modelAndView = new ModelAndView();
        List<Issue> issues = issueService.findAll();
        modelAndView.clear();
        modelAndView.addObject("issues", issues);
        modelAndView.setViewName("/admin");
        return modelAndView;
    }
}
