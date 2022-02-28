package pack.model.selling;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.selling.SellingBean;

public interface SellingAnnoInter {
	@Select("SELECT * FROM project_selling")
	public List<SellingDto> selectDataAll();

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
