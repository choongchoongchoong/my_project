package pack.controller.selling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.model.selling.SellingDaoInter;

@Controller
public class SellingListController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping("selling/list")
	public Model process(Model model) {
		model.addAttribute("datalist", sellingDaoInter.selectDataAll());
		
		return model;
	}
}
