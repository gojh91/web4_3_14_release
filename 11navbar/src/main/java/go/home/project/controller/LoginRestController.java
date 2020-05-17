package go.home.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import go.home.project.model.Member;
import go.home.project.service.MemberService;

@RestController
@RequestMapping("/LoginRest")
public class LoginRestController {
	@Autowired
	private MemberService ms;
	
	
	@RequestMapping(value = "checkLogin")
	public String checkLogin(HttpServletRequest request, Model model, String mb_id, String mb_pw) {
		System.out.println("@RequestMapping(value = \"checkLogin\")");
		Member member = new Member();
		member.setMb_id(mb_id);
		member.setMb_pw(mb_pw);
		int checklogin = ms.checklogin(member);//id,pw,status check(count) 1 = true 0 = false
		String result = "login";

		if (checklogin == 1) {
			member = ms.memberdetail(member);
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);//login member detail
			session.setAttribute("checkLogin", checklogin);//check(count) 1 = true 0 = false

			int authority = Integer.parseInt(member.getMb_authority());
			if (authority == 2) {
				result = "memberList";
			} else {
				result = "main";
			}
		}
		return result;
	}
	
	
	@RequestMapping("nickNameChk")
	public int nicknamechk(Model model, HttpServletRequest request, String mb_nickName ) {
		System.out.println("@RequestMapping(value = \"nickNameChk\")");
		int nickcheck = ms.memberNickNameCnt(mb_nickName);//count check 1 or 0
		return nickcheck;
	}
	
	@RequestMapping("idChk")
	public int idChk(Model model, HttpServletRequest request, String mb_id ) {
		System.out.println("@RequestMapping(value = \"idChk\")");
		int idcheck = ms.memberIdCnt(mb_id);//count check 1 or 0
		return idcheck;
	}
	
	@RequestMapping(value = "memberIdFind1")
	public String memberIdFind1(Model model, String mb_email, String mb_name, String mb_nickName) {
		System.out.println("@RequestMapping(value = \"memberIdFind1\")");
		Member member = new Member();
		member.setMb_email(mb_email);
		member.setMb_name(mb_name);
		member.setMb_nickName(mb_nickName);
		String findid = ms.idFind(member);
		return findid;
	}
	
	@RequestMapping(value = "memberPwFind1")
	public int memberPwFind1(Model model, String mb_email, String mb_name, String mb_nickName, String mb_id) {
		System.out.println("@RequestMapping(value = \"memberPwFind1\")");
		String result = "";
		Member member = new Member();
		member.setMb_id(mb_id);
		member.setMb_email(mb_email);
		member.setMb_name(mb_name);
		member.setMb_nickName(mb_nickName);
		int findpw = ms.pwFind(member); //count 1 = true 0 = false
		
		return findpw;
	}
	
	

}
