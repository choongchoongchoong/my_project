package pack.model.selling;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellingDto {	

	private int se_no, user_no, se_readcnt, co_no;
	private String se_title, se_content, se_cat, se_state, 
					se_price, se_regdate, filename, filepath, user_id,
					user_auth, co_content, co_regdate;

}
