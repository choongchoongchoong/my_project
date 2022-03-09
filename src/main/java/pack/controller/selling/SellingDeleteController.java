package pack.controller.selling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.selling.SellingDaoInter;

@Controller
public class SellingDeleteController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping("sellingDelete")
	public String del(Model model, @RequestParam("se_no") int se_no) {
		System.out.println(se_no);
		
		boolean result = sellingDaoInter.deleteData(se_no);
		
		if(result) {
			model.addAttribute("msg", "판매글 삭제가 완료되었습니다.");
			model.addAttribute("url", "/selling/list");
			return "redirect";
		}else {
			model.addAttribute("msg", "판매글 삭제 에러!!!");
			System.out.println("판매글 삭제 에러!!!");
			return "error";
		}
	}
}
