package pack.model.member;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.member.MemberBean;

public interface MemberAnnoInter {
	
	//회원정보 전체
	@Select("SELECT * FROM project_member ORDER BY num ASC")
	public List<MemberDto> getDataAll();
	
	//로그인
	@Select("SELECT * FROM project_member WHERE user_id=#{user_id} and user_pwd=#{user_pwd}")
	public MemberDto login(MemberBean bean);
	
	//아이디 찾기
	@Select("SELECT user_id FROM project_member WHERE user_name=#{user_name} and user_email=#{user_email}")
	public MemberDto findid(MemberBean bean);
	
	//회원가입
	@Insert("INSERT INTO project_member VALUES(#{user_id},#{user_pwd},#{user_name},#{user_sex}"
			+ ",#{user_birth},#{user_email},#{user_address},#{user_tel},0)")
	public int insertData(MemberBean bean);
	
	//아이디 중복체크
	@Select("SELECT COUNT(*) FROM project_member WHERE user_id=#{user_id}")
	public int checkid(MemberBean bean);
	
	//회원정보 수정
	@Update("UPDATE project_member SET user_pwd=#{user_pwd},user_name=#{user_name},"
			+ "user_sex=#{user_sex},user_birth=#{user_birth},user_email=#{user_email},"
			+ "user_address=#{user_address},user_tel=#{user_tel} WHERE user_id=#{user_id}")
	public int updateData(MemberBean bean);
	
	//회원탈퇴
	@Delete("DELETE FROM project_member WHERE user_id=#{user_id}")
	public int deleteData(String user_id);
	
}
