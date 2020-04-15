package go.home.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.home.project.model.Member;
import go.home.project.service.MemberPaging;
import go.home.project.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	private MemberService ms;

	@RequestMapping(value = "login")
	public String login() {
		System.out.println("@RequestMapping(value = \"login\")");
		return "login";
	}

	@RequestMapping(value = "memberList")
	public String memberList(HttpServletRequest request, Member member, String currentPage, Model model) {
		System.out.println("@RequestMapping(value = \"memberList\")");
		int total = ms.totalMember();//회원가입 인원수 가져옴

		MemberPaging pg = new MemberPaging(total, currentPage);
		member.setStart(pg.getStart());//가져올 맴버 시작번호
		member.setEnd(pg.getEnd());//가져올 맴버 끝번호

		List<Member> listMember = ms.listMember(member);//시작~끝번호 맴버 가져옴
		model.addAttribute("listMember", listMember);
		model.addAttribute("pg", pg);
		return "memberList";
	}

	@RequestMapping(value = "memberUpdateForm")
	public String memberUpdateForm(HttpServletRequest request, Model model) {

		System.out.println("@RequestMapping(value = \"memberUpdateForm\")");
		String birthDate = "";
		String regDate = "";
		String wdDate = "";
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginMember");
		birthDate = member.getMb_birthDate();
		if (birthDate.length() > 9) {
			member.setMb_birthDate(birthDate.substring(0, 10));
		}
		regDate = member.getMb_regDate();
		if (regDate.length() > 9) {
			member.setMb_regDate(regDate.substring(0, 10));
		}
		wdDate = member.getMb_wdDate();
		if (wdDate == null) {
			member.setMb_wdDate("");
		} else {
			if (wdDate.length() > 9) {
				member.setMb_wdDate(wdDate.substring(0, 10));
			}
		}

		model.addAttribute("member", member);

		return "memberUpdateForm";
	}

	@RequestMapping(value = "memberUpdateForm2")
	public String memberUpdateForm3(HttpServletRequest request, String mb_id, Model model) {
		System.out.println("@RequestMapping(value = \"memberUpdateForm2\")");
		String birthDate = "";
		String regDate = "";
		String wdDate = "";
		
		Member member = new Member();
		
		member.setMb_id(mb_id);

		member = ms.memberdetail(member); 
		
		birthDate = member.getMb_birthDate();
		if (birthDate.length() > 9) {
			member.setMb_birthDate(birthDate.substring(0, 10));
		}
		regDate = member.getMb_regDate();
		if (regDate.length() > 9) {
			member.setMb_regDate(regDate.substring(0, 10));
		}
		wdDate = member.getMb_wdDate();
		if (wdDate == null) {
			member.setMb_wdDate("");
		} else {
			if (wdDate.length() > 9) {
				member.setMb_wdDate(wdDate.substring(0, 10));
			}
		}
		model.addAttribute("member", member); 
		return "memberUpdateForm2";
	}
	
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(HttpServletRequest request, Member member, Model model) {
		System.out.println("@RequestMapping(value = \"memberUpdate\")");				

		ms.update(member);//맴버 수정사항 업데이트
		
		return "forward:main.do";
	}
	
	@RequestMapping(value = "memberLogout")//로그아웃 클릭 했을 때
	public String memberUpdate(HttpServletRequest request, Model model) {
		System.out.println("@RequestMapping(value = \"memberLogout\")");

		request.getSession().invalidate();//세션 초기화
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "memberWriteForm")//회원가입 폼으로 보내 줌
	public String memberWriteForm() {
		System.out.println("@RequestMapping(value = \"memberWriteForm\")");
		return "memberWriteForm";
	}
	
	@RequestMapping(value = "memberWrite", method = RequestMethod.POST)//회원가입 저장버튼
	public String memberWrite(HttpServletRequest request, Member member, Model model) {
		System.out.println("@RequestMapping(value = \"memberWrite\")");
		String str = member.getMb_birthDate();
		if (str.length() > 9) {
			member.setMb_birthDate(str.substring(0, 10));
		}
		ms.insert(member);
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "memberDeleteForm")
	public String memberDeleteForm(HttpServletRequest request, String mb_id, Model model) {
		System.out.println("@RequestMapping(value = \"memberDeleteForm\")");
		Member member = new Member();
		member.setMb_id(mb_id);
		member = ms.memberdetail(member); 
		model.addAttribute("member", member);
		return "memberDeleteForm";
	}
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String memberDelete(HttpServletRequest request, String mb_id, Model model) {
		System.out.println("@RequestMapping(value = \"memberDelete\")");
		ms.memberdelete(mb_id);
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "memberIdFind")
	public String memberIdFind(Model model) {
		System.out.println("@RequestMapping(value = \"memberIdFind\")");
		return "memberIdFind";
	}
	
	@RequestMapping(value = "memberPwFind")
	public String memberPwFind(Model model) {
		System.out.println("@RequestMapping(value = \"memberPwFind\")");
		return "memberPwFind";
	}
	
	@RequestMapping(value = "changePwForm")
	public String changePwForm(Model model, Member member) {
		System.out.println("@RequestMapping(value = \"changePwForm\")");
		model.addAttribute("member", member);
		return "changePwForm";
	}
	
	@RequestMapping(value = "changePw")
	public String changePw(Model model, Member member) {
		System.out.println("@RequestMapping(value = \"changePw\")");
		ms.changepw(member);
		return "redirect:main.do";
	}
}
