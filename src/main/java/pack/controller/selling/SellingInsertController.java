package pack.controller.selling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String submit(SellingBean bean) {
		System.out.println(bean.getSe_no() + " " + bean.getUser_no());
		
		boolean b = sellingDaoInter.insertData(bean);
		
		if(b) {
			
			return "redirect:/list";  //추가 후 회원보기로 이동. 클라이언트를 통해 서버에게 파일을 요청			
		}else {
			
			return "redirect:/error";
		}
	}
}
