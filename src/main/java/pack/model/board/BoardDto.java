package pack.model.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDto {	
	private int bd_no, bd_readcnt;
	private String bd_cat, bd_title, bd_content, bd_id, bd_date;
}
