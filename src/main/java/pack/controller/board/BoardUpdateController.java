package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.board.BoardDaoInter;
import pack.model.board.BoardDto;

@Controller
public class BoardUpdateController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("bd_no") int bd_no) {
		//수정할 게시글 정보 읽기
		BoardDto boardDto = boardDaoInter.selectDataOne(bd_no);
		model.addAttribute("data", boardDto);
		
		return "board/updateform";   //수정화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.POST)
	public String submit(Model model, BoardBean bean) {
		System.out.println("글번호"+bean.getBd_no());
		
		boolean result = boardDaoInter.updateData(bean);
		
		if(result) {
			model.addAttribute("msg", "게시글 수정이 완료되었습니다.");
			model.addAttribute("url","/board/list");
			
			return "redirect";  //수정 후 회원보기로 이동. 클라이언트를 통해 서버에게 파일을 요청			
		}else {
			model.addAttribute("msg", "공지사항 게시글 수정 에러!!!");
			System.out.println("공지사항 게시글 수정 에러!!!");
			
			return "error";
		}
	}
}
