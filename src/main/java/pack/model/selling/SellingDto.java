package pack.model.selling;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellingDto {	
	private int se_no, user_no;
	private String se_title, se_content, se_pic, se_cat, se_brand, se_state, 
					se_price, se_regdate;
}
