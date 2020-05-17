package go.home.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.home.project.model.Board;
import go.home.project.model.Member;
import go.home.project.model.Menu;
import go.home.project.model.Reply;
import go.home.project.model.ResInfo;
import go.home.project.model.ResInfoBoard;
import go.home.project.service.MainService;
import go.home.project.service.ResService;

@Controller
public class MainController {
	@Autowired
	private MainService ms;
	
	@Autowired
	private ResService rs;

	@RequestMapping(value = "main")
	public String MainPage(HttpServletRequest request, Model model) {
		System.out.println("@RequestMapping(value = \"main\")");
		if(request.getSession().getAttribute("checkLogin") != null) {
			//In session login member, login상태 
			HttpSession session = request.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int checkLogin = (Integer)session.getAttribute("checkLogin");
//			model.addAttribute("loginMember", loginMember);
//			model.addAttribute("checkLogin", checkLogin);
			
			if (Integer.parseInt(loginMember.getMb_authority()) ==2) {
				return "forward:memberList.do";//운영자 페이지
			}
		}
		List<ResInfo> reslist = ms.reslist();
		model.addAttribute("reslist", reslist);
		return "main";
	}
	
	@RequestMapping(value = "search")
	public String search(String keyword, Model model,HttpServletRequest request) {
		System.out.println("@RequestMapping(value = \"search\")");
		
		/*if(keyword != null && !keyword.isEmpty()) {*/
			List<Menu> menukeyword = ms.searchmenu(keyword);
			int searchmenu = ms.searchmenu1(keyword);
			List<Reply> replykeyword = ms.searchreply(keyword);
			int searchreply = ms.searchreply1(keyword);
			List<Board> boardkeyword = ms.searchboard(keyword);
			int searchboard = ms.searchboard1(keyword);
			List<ResInfo> resinfokeyword = ms.searchresinfo(keyword);
			int searchresinfo = ms.searchresinfo1(keyword);
			List<ResInfoBoard> resinfoboardkeyword = ms.searchresinfoboard(keyword);
			int searchresinfoboard = ms.searchresinfoboard1(keyword);
			
			model.addAttribute("menukeyword", menukeyword);
			model.addAttribute("searchmenu", searchmenu);
			model.addAttribute("replykeyword", replykeyword);
			model.addAttribute("searchreply", searchreply);
			model.addAttribute("boardkeyword", boardkeyword);
			model.addAttribute("searchboard", searchboard);
			model.addAttribute("resinfokeyword", resinfokeyword);
			model.addAttribute("searchresinfo", searchresinfo);
			model.addAttribute("resinfoboardkeyword", resinfoboardkeyword);
			model.addAttribute("searchresinfoboard", searchresinfoboard);
			
			return "search";
		/*}
		
		return null;*/
	}
	
	@RequestMapping(value="resInfo",method=RequestMethod.GET )
	public String resInfo(int res_num, Model model,HttpServletRequest request) {
		System.out.println("@RequestMapping(value = \"resInfo\")");
		
		ResInfo ri = rs.getResInfo(res_num);
		List<Menu> menu =  rs.getMenuInfo(res_num);
				
		model.addAttribute("resInfo", ri);
		model.addAttribute("menu", menu);
		return "resInfo";
	}
	
}


