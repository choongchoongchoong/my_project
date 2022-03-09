package pack.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.member.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDaoInter {
	@Autowired
	public MemberAnnoInter memberAnnoInter;  //SQL문이 담긴 어노테이션 관리 인터페이스
	
	@Autowired
	public MemberDaoInter memberDaoInter;

	/* 로그인 */
	@Override
	public MemberBean login(MemberBean bean) {
		
		return memberAnnoInter.login(bean);
	}
	
	/* 아이디 찾기 */
	@Override
	public MemberDto findid(MemberBean bean) {
		
		return memberAnnoInter.findid(bean);
	}

	/* 비밀번호 찾기 */
	@Override
	public MemberDto findpwd(MemberBean bean) {
		
		return memberAnnoInter.findpwd(bean);
	}

	/* 회원가입 */
	@Override
	public boolean insertData(MemberBean bean) {
		int result = memberAnnoInter.insertData(bean);
		
		if(result > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/* 아이디 중복체크 */
	@Override
	public int checkid(MemberBean bean) {
		int result = memberAnnoInter.checkid(bean);
		
		return result;
	}
	
	/* 회원탈퇴 */
	@Override
	public boolean deleteData(String user_id) {
		int result = memberAnnoInter.deleteData(user_id);
		
		if(result > 0) {
			return true;
		}
		else {
			return false;
		}
	}

	
	
	
	/*
	@Override
	public boolean insert(MemberBean bean) {
		// 회원 가입
		int re = getSqlSession().insert("SignUp", bean);

		if (re > 0)
			return true;
		else
			return false;
	}
	
	@Override
	public int checkid(MemberBean bean) throws Exception {
		// 아이디 중복 확인
		int result =getSqlSession().selectOne("checkid",bean);
		return result;
	}

	@Override
	public void memberUpdate(MemberBean bean) throws Exception {
		// 회원 정보 수정
		getSqlSession().update("MemberUpdate", bean);
	}
	
	@Override
	public void memberDelete(MemberBean bean) {
		// 회원 탈퇴
		try {
			getSqlSession().delete("MemberDelete", bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public MemberBean findpwd(String email) {
		// 비밀번호찾기
		return getSqlSession().selectOne("Findpwd",email);
	}
	
	
	@Override
	public void changepwd(MemberBean bean) throws Exception {
		// 비밀번호 변경
		getSqlSession().update("Updatepwd", bean);
		
	}
	*/

}	
