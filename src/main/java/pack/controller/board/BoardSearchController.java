package pack.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.model.board.BoardDaoInter;
import pack.model.board.BoardDto;

@Controller
public class BoardSearchController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping("board/boardSearch")
	public ModelAndView search(BoardBean bean) {
		List<BoardDto> list = boardDaoInter.search(bean);
		
		return new ModelAndView("board/list", "boardlist", list);  //view 파일명, key, value

	}

}
