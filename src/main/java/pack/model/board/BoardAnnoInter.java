package pack.model.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.board.BoardBean;

public interface BoardAnnoInter {
	//게시글 리스트
	@Select("SELECT * FROM project_board ORDER BY bd_no DESC")
	public List<BoardDto> selectDataAll();
	
	//글내용 상세보기
	@Select("SELECT * FROM project_board WHERE bd_no=#{bd_no}")
	public BoardDto selectDataOne(int bd_no);
	
	//조회수 처리
	@Update("UPDATE project_board SET bd_readcnt=bd_readcnt+1 WHERE bd_no=#{bd_no}")
	public int updateReadcnt(int bd_no);
	
	//게시글 추가
	@Insert("INSERT INTO project_board VALUES(bd_no.NEXTVAL,#{user_no},#{user_id},#{user_auth},"
			+ "#{bd_title},#{bd_content},SYSDATE,0)")
	public int insertData(BoardBean bean);
	
	//게시글 수정
	@Update("UPDATE project_board SET bd_title=#{bd_title},bd_content=#{bd_content} WHERE bd_no=#{bd_no}")
	public int updateData(BoardBean bean);
	
	//게시글 삭제
	@Delete("DELETE FROM project_board WHERE bd_no=#{bd_no}")
	public int deleteData(int bd_no);
	
	//게시글 검색
	@Select("SELECT * FROM project_board WHERE ${searchName} like '%' || #{searchValue} || '%' ORDER BY bd_no DESC")
	public List<BoardDto> search(BoardBean bean);
}
