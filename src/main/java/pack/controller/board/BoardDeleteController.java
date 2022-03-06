package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.board.BoardDaoInter;

@Controller
public class BoardDeleteController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("boardDelete")
	public String del(Model model, @RequestParam("bd_no") int bd_no) {
		System.out.println(bd_no);
		
		boolean result = boardDaoInter.deleteData(bd_no);
		
		if(result) {
			model.addAttribute("msg", "게시글 삭제가 완료되었습니다.");
			model.addAttribute("url","/board/list");
			
			return "redirect";
		}else {
			model.addAttribute("msg", "공지사항 게시글 삭제 에러!!!");
			System.out.println("공지사항 게시글 삭제 에러!!!");
			
			return "error";
		}
	}
}
