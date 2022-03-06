package pack.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardErrorController {
	@RequestMapping("error")
	public String err() {
		
		return "error";
	}
}
