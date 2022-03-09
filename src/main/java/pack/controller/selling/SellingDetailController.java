package pack.controller.selling;

import java.util.List;

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
		
		//상품내용 상세보기
		SellingDto sellingDto = sellingDaoInter.selectDataOne(se_no);
		//조회수 처리
		sellingDaoInter.updateReadcnt(se_no);
		//코멘트 불러오기
		List<SellingDto> list = sellingDaoInter.selectCommentAll(se_no);
		
		model.addAttribute("data", sellingDto);
		model.addAttribute("commentlist", list);
		
		return model;
	}

}
