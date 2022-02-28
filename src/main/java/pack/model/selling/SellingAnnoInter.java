package pack.model.selling;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.member.MemberBean;
import pack.controller.selling.SellingBean;

public interface SellingAnnoInter {
	//메인화면 표시용
	@Select("SELECT * FROM ("
			+ "SELECT a.se_no,a.user_no,a.se_title,a.se_content,a.se_cat,a.se_state,a.se_price,a.se_regdate,a.filename,a.filepath,b.user_id "
			+ "FROM project_selling a LEFT JOIN project_member b ON a.user_no = b.user_no "
			+ "ORDER BY dbms_random.value"
			+ ") WHERE rownum <=9")
	public List<SellingDto> selectDataAll();
	
	//나의 판매목록 표시용
	@Select("SELECT * FROM project_selling WHERE user_no=#{user_no} ORDER BY se_no ASC")
	public List<SellingDto> selectDataMine(int user_no);

	/*
	@Insert("INSERT INTO project_selling(se_title,se_content,se_cat,se_state,se_price,se_regdate,filename,filepath) "
			+ "VALUES(#{se_title},#{se_content},#{se_cat},#{se_state},#{se_price},SYSDATE,#{filename},#{filepath})")
	public int insertData(SellingBean bean);
	*/
	
	@Insert("INSERT INTO project_selling VALUES(se_no.NEXTVAL,#{user_no},#{se_title},#{se_content},#{se_cat},#{se_state},#{se_price},SYSDATE,#{filename},#{filepath})")
	public int insertData(SellingBean bean);
	
	/*
	@Insert("INSERT INTO project_selling VALUES(#{se_no},#{user_no},#{se_title},#{se_content},#{se_pic},#{se_cat},"
			+ #{se_state},#{se_price},SYSDATE)")
	public int insertData(SellingBean bean);
	*/
	
	/*
	@Select("SELECT * FROM project_board WHERE bd_no=#{bd_no}")
	public BoardDto selectDataOne(String bd_no);
	@Update("UPDATE project_board SET name=#{name},addr=#{addr} WHERE num=#{num}")
	public int updateData(BoardBean bean);
	
	@Delete("DELETE FROM project_board WHERE bd_no=#{bd_no}")
	public int deleteData(String bd_no);+*/
}
