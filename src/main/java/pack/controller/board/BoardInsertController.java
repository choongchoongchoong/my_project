package pack.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.model.board.BoardDaoInter;

@Controller
public class BoardInsertController {
	@Autowired
	private BoardDaoInter boardDaoInter;
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String insert() {
		
		return "board/insertform";  //입력화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String submit(BoardBean bean) {
		System.out.println(bean.getBd_title());
		
		boolean b = boardDaoInter.insertData(bean);
		
		if(b) {
			
			return "redirect:/list";  //추가 후 회원보기로 이동. 클라이언트를 통해 서버에게 파일을 요청			
		}else {
			
			return "redirect:/error";
		}
	}
}
