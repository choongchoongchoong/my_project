package pack.controller.selling;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.controller.member.MemberBean;
import pack.model.selling.SellingDaoInter;

@Controller
public class SellingCommentController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	/* 코멘트 작성 */
	@RequestMapping("selling/commentInsert")
	public String commentInsert(SellingBean bean, Model model,
			HttpServletRequest req, @RequestParam("se_no") int se_no) {
		
		//로그인된 사용자 세션 정보 취득
		HttpSession session = req.getSession();
		MemberBean res = (MemberBean) session.getAttribute("loginSession");
		System.out.println("로그인된 회원 아이디 : " + res.getUser_id());
		System.out.println("로그인된 회원 번호 : " + res.getUser_no());
		//로그인된 사용자 정보
		int userNo = res.getUser_no();
		String userId = res.getUser_id();
		String userAuth = res.getUser_auth();
		
		//로그인 유저 정보 저장
		bean.setUser_no(userNo);
		bean.setUser_id(userId);
		bean.setUser_auth(userAuth);
		
		//판매글 번호 저장
		bean.setSe_no(se_no);
		
		boolean result = sellingDaoInter.insertComment(bean);
		
		if(result) {
			String url = "/selling/detail?se_no=" + se_no;
			model.addAttribute("msg", "댓글 등록이 완료되었습니다.");
			model.addAttribute("url", url);
			return "redirect";
		}else {
			model.addAttribute("msg", "댓글 등록 에러!!!");
			System.out.println("댓글 등록 에러!!!");
			return "error";
		}
		
	}
	
	/* 코멘트 수정 */
	@RequestMapping("commentUpdate")
	public String commentUpdate(SellingBean bean, Model model, 
			@RequestParam("se_no") int se_no, 
			@RequestParam("co_no") int co_no, 
			@RequestParam("editedContent") String editedContent) {
		
		System.out.println(se_no);
		System.out.println(co_no);
		System.out.println(editedContent);
		
		bean.setCo_no(co_no);
		bean.setCo_content(editedContent);
		
		System.out.println(bean.getCo_no());
		System.out.println(bean.getCo_content());
		
		boolean result = sellingDaoInter.updateComment(bean);
		
		if(result) {
			String url = "/selling/detail?se_no=" + se_no;
			model.addAttribute("msg", "댓글이 수정되었습니다.");
			model.addAttribute("url", url);
			return "redirect";			
		}else {
			model.addAttribute("msg", "판매글 수정 에러!!!");
			System.out.println("판매글 수정 에러!!!");
			
			return "error";
		}
	}
	
	
	/* 코멘트 삭제 */
	@RequestMapping("commentDelete")
	public String commentDelete(SellingBean bean, Model model, 
			@RequestParam("se_no") int se_no, @RequestParam("co_no") int co_no) {
		
		boolean result = sellingDaoInter.deleteComment(co_no);
		
		if(result) {
			String url = "/selling/detail?se_no=" + se_no;
			model.addAttribute("msg", "댓글 삭제가 완료되었습니다.");
			model.addAttribute("url", url);
			return "redirect";
		}else {
			model.addAttribute("msg", "댓글 삭제 에러!!!");
			System.out.println("댓글 삭제 에러!!!");
			return "error";
		}
				
	}
	
}
