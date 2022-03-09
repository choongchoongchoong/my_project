package pack.controller.selling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.model.selling.SellingDaoInter;
import pack.model.selling.SellingDto;

@Controller
public class SellingSearchController {
	@Autowired
	private SellingDaoInter sellingDaoInter;
	
	@RequestMapping("sellingSearch")
	public ModelAndView search(SellingBean bean) {
		List<SellingDto> list = sellingDaoInter.search(bean.getSearchValue());
		
		return new ModelAndView("selling/searchresult", "datalist", list);  //view 파일명, key, value

	}
}
