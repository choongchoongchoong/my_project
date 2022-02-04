package pack.model.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.board.BoardBean;

public interface BoardAnnoInter {
	@Select("SELECT * FROM project_board ORDER BY bd_no ASC")
	public List<BoardDto> selectDataAll();

	@Select("SELECT * FROM project_board WHERE bd_no=#{bd_no}")
	public BoardDto selectDataOne(String bd_no);
	
	@Insert("INSERT INTO project_board VALUES(#{bd_no},#{bd_cat},#{bd_title},#{bd_content},"
			+ "#{bd_id},SYSDATE,0)")
	public int insertData(BoardBean bean);
	
	@Update("UPDATE project_board SET name=#{name},addr=#{addr} WHERE num=#{num}")
	public int updateData(BoardBean bean);
	
	@Delete("DELETE FROM project_board WHERE bd_no=#{bd_no}")
	public int deleteData(String bd_no);
}
