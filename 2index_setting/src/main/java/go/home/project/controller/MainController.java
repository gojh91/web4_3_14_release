package go.home.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "main")
	public String MainPage(HttpServletRequest request, Model model) {
		System.out.println("@RequestMapping(value = \"main\")");
		
		return "main";
	}
	

	
	
	
}


