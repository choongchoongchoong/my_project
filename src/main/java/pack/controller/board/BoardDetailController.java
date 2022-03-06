package pack.controller.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.board.BoardDaoInter;
import pack.model.board.BoardDto;

@Controller
public class BoardDetailController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("board/detail")
	public Model detailProcess(Model model, HttpServletRequest req,
			@RequestParam("bd_no") int bd_no) {
		
		BoardDto boardDto = boardDaoInter.selectDataOne(bd_no);
		boardDaoInter.updateReadcnt(bd_no);
		
		model.addAttribute("data", boardDto);
		
		return model;
	}

}
