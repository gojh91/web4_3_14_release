package go.home.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import go.home.project.model.Member;

@Controller
public class MainController {

	@RequestMapping(value = "main")
	public String MainPage(HttpServletRequest request, Model model) {
		System.out.println("@RequestMapping(value = \"main\")");
		if(request.getSession().getAttribute("checkLogin") != null) {
			//로그인 됬을 때 들어오는 곳
			HttpSession session = request.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int checkLogin = (Integer)session.getAttribute("checkLogin");
			model.addAttribute("loginMember", loginMember);
			model.addAttribute("checkLogin", checkLogin);
			
			if (Integer.parseInt(loginMember.getMb_authority()) ==2) {
				return "forward:memberList.do";//관리자는 관리자 페이지로 이동
			}		
		}
		return "main";
	}
	

	
	
	
}


