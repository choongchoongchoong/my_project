package pack.model.member;

import pack.controller.member.MemberBean;

public interface MemberDaoInter {
	MemberDto login(MemberBean bean);  //로그인
	
	boolean insertData(MemberBean bean);  //회원가입
	
	boolean deleteData(String user_id);  //회원탈퇴
	
	//public void memberDelete(MemberBean bean) throws Exception;
	/*
	public void memberUpdate(MemberBean bean) throws Exception;
	public void changepwd(MemberBean bean) throws Exception;
	public int checkid(MemberBean bean) throws Exception;
	MemberBean findpwd(String email);
	*/
}
 