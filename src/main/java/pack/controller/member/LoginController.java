package pack.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.model.member.MemberDaoInter;

@Controller
public class LoginController {
	@Autowired
	private MemberDaoInter memberDaoInter;
 
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		
		return "member/loginform";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberBean bean, HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();
		//MemberDto memberDto = memberDaoInter.login(bean);
		MemberBean res = memberDaoInter.login(bean);

		if(res != null) {
			model.addAttribute("msg", res.getUser_name()+"님 환영합니다.");
			model.addAttribute("url","/");
			
			session.setAttribute("loginSession", res);
			System.out.println("로그인된 회원번호는!!!!!!" + res.getUser_no());
			
			return "redirect";
			
		}else {
			model.addAttribute("msg","아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url","/login");
			
			return "redirect";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
}
