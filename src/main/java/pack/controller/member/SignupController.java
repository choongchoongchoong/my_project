package pack.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.model.member.MemberDaoInter;

@Controller
public class SignupController {
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup() {
		
		return "member/signupform";
	}
	
	//회원가입 등록
	@RequestMapping(value = "insertMember", method = RequestMethod.POST)
	public String submit(MemberBean bean, Model model) {
		System.out.println(bean.getUser_id());
		System.out.println(bean.getUser_name());
		
		boolean result = memberDaoInter.insertData(bean);
		
		if(result) {
			model.addAttribute("msg","회원가입을 완료했습니다. 로그인 해주세요.");
			model.addAttribute("url","/login");

			return "redirect";
			
		}else {
			
			return "redirect:/error";
		}
	}
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "checkid", method = RequestMethod.POST)
	public int checkid(MemberBean bean) throws Exception {
		int result = memberDaoInter.checkid(bean);
		System.out.println("중복확인 : " + result);
		
		return result;
	}

}
