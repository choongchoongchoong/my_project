package pack.controller.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {
	private int bd_no, user_no, bd_readcnt;
	private String user_id, 
				user_auth, 
				bd_title, 
				bd_content, 
				bd_regdate, 
				searchName, 
				searchValue;
}
