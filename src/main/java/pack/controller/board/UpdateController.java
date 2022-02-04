package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.board.BoardDaoInter;
import pack.model.board.BoardDto;

@Controller
public class UpdateController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam("bd_no") String bd_no) {
		BoardDto dto = boardDaoInter.selectDataOne(bd_no);
		
		return new ModelAndView("updateform", "dto", dto);  //수정화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String submit(BoardBean bean) {
		System.out.println(bean.getBd_title());
		
		boolean b = boardDaoInter.updateData(bean);
		
		if(b) {
			
			return "redirect:/board/board_list";  //수정 후 회원보기로 이동. 클라이언트를 통해 서버에게 파일을 요청			
		}else {
			
			return "redirect:/error";
		}
	}
}
