package pack.model.selling;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.selling.SellingBean;

public interface SellingAnnoInter {
	/* 전체 판매 목록 불러오기 */
	@Select("SELECT * FROM ("
			+ "SELECT a.se_no,a.user_no,a.se_title,a.se_content,a.se_cat,a.se_state,a.se_price,a.se_regdate,a.filename,a.filepath,b.user_id,a.se_readcnt "
			+ "FROM project_selling a LEFT JOIN project_member b ON a.user_no = b.user_no "
			+ "ORDER BY dbms_random.value"
			+ ") WHERE rownum <=9")
	public List<SellingDto> selectDataAll();
	
	/* 나의 판매목록 불러오기 */
	@Select("SELECT * FROM project_selling WHERE user_no=#{user_no} ORDER BY se_no ASC")
	public List<SellingDto> selectDataMine(int user_no);
	
	/* 상품내용 상세보기 */
	@Select("SELECT * FROM ("
			+ "SELECT a.se_no,a.user_no,a.se_title,a.se_content,a.se_cat,a.se_state,a.se_price,a.se_regdate,a.filename,a.filepath,b.user_id,a.se_readcnt "
			+ "FROM project_selling a LEFT JOIN project_member b ON a.user_no = b.user_no"
			+ ") WHERE se_no=#{se_no}")
	public SellingDto selectDataOne(int se_no);
	
	/* 조회수 처리 */
	@Update("UPDATE project_selling SET se_readcnt=se_readcnt+1 WHERE se_no=#{se_no}")
	public int updateReadcnt(int se_no);
	
	/* 상품 등록 */
	@Insert("INSERT INTO project_selling VALUES(se_no.NEXTVAL,#{user_no},#{se_title},#{se_content},#{se_cat},#{se_state},#{se_price},SYSDATE,#{filename},#{filepath},0)")
	public int insertData(SellingBean bean);
	
	/* 상품 수정 */
	@Update("UPDATE project_selling SET se_no=#{se_no},se_content=#{se_content},se_cat=#{se_cat},se_state=#{se_state},se_price=#{se_price},se_regdate=SYSDATE,filename=#{filename},filepath=#{filepath} "
			+ "WHERE se_no=#{se_no}")
	public int updateData(SellingBean bean);
	
	/* 상품 삭제 */
	@Delete("DELETE FROM project_selling WHERE se_no=#{se_no}")
	public int deleteData(int se_no);
	
	/* 상품 검색 */
	@Select("SELECT * FROM project_selling WHERE se_title like '%' || #{searchValue} || '%' ORDER BY se_regdate DESC")
	public List<SellingDto> search(String searchValue);
	
	/* 코멘트 불러오기 */
	@Select("SELECT * FROM project_selling_comment WHERE se_no=#{se_no} ORDER BY co_no DESC")
	public List<SellingDto> selectCommentAll(int se_no);
	
	/* 코멘트 등록 */
	@Insert("INSERT INTO project_selling_comment VALUES(co_no.NEXTVAL,#{user_no},#{user_id},#{user_auth},#{se_no},#{co_content},SYSDATE)")
	public int insertComment(SellingBean bean);
	
	/* 코멘트 수정 */
	@Update("UPDATE project_selling_comment SET co_content=#{co_content},co_regdate=SYSDATE WHERE co_no=#{co_no}")
	public int updateComment(SellingBean bean);
	
	/* 코멘트 삭제 */
	@Delete("DELETE FROM project_selling_comment WHERE co_no=#{co_no}")
	public int deleteComment(int co_no);
}
