package pack.controller.selling;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.selling.SellingDaoInter;
import pack.model.selling.SellingDto;

@Controller
public class SellingDetailController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping("selling/detail")
	public Model detailProcess(Model model, HttpServletRequest req,
			@RequestParam("se_no") int se_no) {
		
		SellingDto sellingDto = sellingDaoInter.selectDataOne(se_no);
		sellingDaoInter.updateReadcnt(se_no);
		
		model.addAttribute("data", sellingDto);
		
		return model;
	}

}
