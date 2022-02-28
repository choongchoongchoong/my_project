package pack.controller.selling;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.controller.member.MemberBean;
import pack.model.selling.SellingDaoInter;
import pack.model.selling.SellingDto;

@Controller
public class SellingListController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping("selling/list")
	public Model process(Model model, HttpServletRequest req) {
		
		//로그인된 사용자 세션 정보 취득
		HttpSession session = req.getSession();
		MemberBean res = (MemberBean) session.getAttribute("loginSession");
		System.out.println("로그인된 회원 아이디 : " + res.getUser_id());
		System.out.println("로그인된 회원 번호 : " + res.getUser_no());
		int user_no = res.getUser_no();
		
		List<SellingDto> list = sellingDaoInter.selectDataMine(user_no);

		model.addAttribute("datalist", list);
		
		return model;
	}
}
