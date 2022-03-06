package pack.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.controller.member.MemberBean;
import pack.model.board.BoardDaoInter;
import pack.model.member.MemberDto;

@Controller
public class BoardInsertController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping(value = "boardInsert", method = RequestMethod.GET)
	public String insert() {
		
		return "board/insertform";  //입력화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "boardInsert", method = RequestMethod.POST)
	public String submit(BoardBean bean, Model model, 
			HttpServletRequest req, MemberDto memberDto) {
		
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
		
		System.out.println(bean.getBd_title());
		System.out.println(bean.getUser_id() + "유저권한 : " + bean.getUser_auth());
		
		boolean result = boardDaoInter.insertData(bean);
		
		if(result) {
			model.addAttribute("msg", "게시글 등록이 완료되었습니다.");
			model.addAttribute("url","/board/list");
			return "redirect";			
		}else {
			model.addAttribute("msg", "공지사항 게시글 등록 에러!!!");
			System.out.println("공지사항 게시글 등록 에러!!!");
			return "error";
		}
	}
}
