package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.board.BoardDaoInter;

@Controller
public class DeleteController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("delete")
	public String del(@RequestParam("bd_no") String bd_no) {
		if(boardDaoInter.deleteData(bd_no)) {
			
			return "redirect:/board/board_list";
		}else {
			
			return "redirect:/error";
		}
	}
}
