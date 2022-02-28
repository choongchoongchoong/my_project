package pack.controller.selling;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellingBean {
	
	private int se_no, user_no;
	private String se_title, se_content, se_cat, se_state, 
					se_price, se_regdate, filename, filepath;
}
