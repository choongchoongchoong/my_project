package pack.controller.selling;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import pack.controller.member.MemberBean;
import pack.model.member.MemberDto;
import pack.model.selling.SellingDaoInter;

@Controller
public class SellingInsertController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping(value = "selling", method = RequestMethod.GET)
	public String insert() {
		
		return "selling/insertform";  //입력화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "sell", method = RequestMethod.POST)
	public String fileForm(SellingBean bean, Model model, 
			MultipartFile se_pic, HttpServletRequest req, MemberDto memberDto) throws Exception {
		
		//저장 경로 지정
		String projectPath = "C:\\Users\\dynabook\\Pictures\\Saved Pictures";
		//랜덤 파일명 생성
		UUID uuid = UUID.randomUUID();
		//파일 이름 = 랜덤 파일명 + 첨부파일명
		String fileName = uuid + "_" + se_pic.getOriginalFilename();

		File saveFile = new File(projectPath, fileName);
				
		se_pic.transferTo(saveFile);
		
		//파일명, 파일경로 저장
		bean.setFilename(fileName);
		bean.setFilepath("/" + fileName);
		System.out.println(bean.getFilename());
		System.out.println(bean.getFilepath());
		
		//로그인된 사용자 세션 정보 취득
		HttpSession session = req.getSession();
		MemberBean res = (MemberBean) session.getAttribute("loginSession");
		System.out.println("로그인된 회원 아이디 : " + res.getUser_id());
		System.out.println("로그인된 회원 번호 : " + res.getUser_no());
		int userNo = res.getUser_no();
		
		//유저번호 저장
		bean.setUser_no(userNo);
		
		boolean result = sellingDaoInter.insertData(bean);
		
		if(result) {
			model.addAttribute("msg", "상품 등록이 완료되었습니다.");
			model.addAttribute("url","/selling/list");
			return "redirect";
		}else {
			return "redirect:/error";
		}
		
	}

}
