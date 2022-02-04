package pack.model.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDto {
	private String user_id,
			user_pwd,
			user_name,
			user_sex,
			user_birth,
			user_email,
			user_address,
			user_tel,
			user_auth;
}
 