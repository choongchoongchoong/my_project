package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.model.board.BoardDaoInter;

@Controller
public class ListController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("board/list")
	public Model process(Model model) {
		model.addAttribute("listdata", boardDaoInter.selectDataAll());
		
		return model;
	}
}
