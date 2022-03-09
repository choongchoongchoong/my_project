package pack.controller.selling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.selling.SellingDaoInter;
import pack.model.selling.SellingDto;

@Controller
public class SellingUpdateController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping(value = "sellingUpdate", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("se_no") int se_no) {
		//수정할 게시글 정보 읽기
		SellingDto sellingDto = sellingDaoInter.selectDataOne(se_no);
		model.addAttribute("data", sellingDto);
		
		return "selling/updateform";   //수정화면용 jsp를 forward 방식으로 호출 (서버에서 서버의 파일을 직접 호출 후 클라이언트에 전송)
	}
	
	@RequestMapping(value = "sellingUpdate", method = RequestMethod.POST)
	public String submit(Model model, SellingBean bean) {
		System.out.println("글번호"+bean.getSe_no());
		
		boolean result = sellingDaoInter.updateData(bean);
		
		if(result) {
			model.addAttribute("msg", "판매글 수정이 완료되었습니다.");
			model.addAttribute("url","/selling/list");
			return "redirect";			
		}else {
			model.addAttribute("msg", "판매글 수정 에러!!!");
			System.out.println("판매글 수정 에러!!!");
			return "error";
		}
	}
}
