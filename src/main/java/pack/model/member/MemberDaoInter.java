package pack.model.member;

import pack.controller.member.MemberBean;

public interface MemberDaoInter {
	MemberBean login(MemberBean bean);  //로그인
	
	MemberDto findid(MemberBean bean);  //아이디 찾기
	MemberDto findpwd(MemberBean bean);  //비밀번호 찾기
	
	boolean insertData(MemberBean bean);  //회원가입
	int checkid(MemberBean bean);  //아이디 중복체크
	
	boolean deleteData(String user_id);  //회원탈퇴
	
	//public void memberDelete(MemberBean bean) throws Exception;
	/*
	public void memberUpdate(MemberBean bean) throws Exception;
	public void changepwd(MemberBean bean) throws Exception;
	public int checkid(MemberBean bean) throws Exception;
	*/
}
 