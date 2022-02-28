package pack.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.model.selling.SellingDaoInter;

@Controller
public class HomeController {
	@Autowired
	private SellingDaoInter sellingDaoInter;

	@RequestMapping("main")
	public Model home(Model model) {
		model.addAttribute("datalist", sellingDaoInter.selectDataAll());
		
		return model;
	}
}
