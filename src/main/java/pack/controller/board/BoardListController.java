package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.model.board.BoardDaoInter;

@Controller
public class BoardListController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("board/list")
	public Model process(Model model) {
		model.addAttribute("boardlist", boardDaoInter.selectDataAll());
		
		return model;
	}
	
	@RequestMapping(value = "test2", method = RequestMethod.GET)
	public String test2() {
		
		return "test2";
	}
}
