package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.persistence.entities.Employee;
import project.service.EmployeeService;

@Controller
public class LoginController {
	
	// Instance Variables
    EmployeeService employeeService;

    // Dependency Injection
    @Autowired
    public LoginController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    // Request mapping is the path that you want to map this method to
    // In this case, the mapping is the root "/", so when the project
    // is running and you enter "localhost:8080/login" into a browser, this
    // method is called
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(HttpSession session){

        // The string "Login" that is returned here is the name of the view
        // (the Login.jsp file) that is in the path /main/webapp/WEB-INF/jsp/
        // If you change "Login" to something else, be sure you have a .jsp
        // file that has the same name
    	
    	Long user = (Long)session.getAttribute("loggedInUser");
    	if(user == null){
    		return "login";
    	}
    	return "redirect:/clock";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String userId, @RequestParam String password,
    		Model model, HttpSession session){
    	
    	Employee employee = employeeService.verifyLogin(userId, password);
    	if(employee == null){
    		model.addAttribute("loginError", "Username or Password is inccorect. Try again");
    		return "login";
    	}
    	
    	session.setAttribute("loggedInUser", employee.getId());
    	//model.addAttribute("loginError", "you have logged in");
    	return "redirect:/clock";
    }
}
