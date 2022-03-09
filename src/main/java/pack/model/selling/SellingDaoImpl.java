package pack.model.selling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.selling.SellingBean;

@Repository
public class SellingDaoImpl implements SellingDaoInter{
	@Autowired
	public SellingAnnoInter sellingAnnoInter;  //SQL문이 담긴 어노테이션 관리 인터페이스

	/* 전체 판매 목록 불러오기 */
	@Override
	public List<SellingDto> selectDataAll() {
		
		return sellingAnnoInter.selectDataAll();
	}
	
	/* 나의 판매목록 불러오기 */
	@Override
	public List<SellingDto> selectDataMine(int user_no) {
		
		return sellingAnnoInter.selectDataMine(user_no);
	}
	
	/* 상품내용 상세보기 */
	@Override
	public SellingDto selectDataOne(int se_no) {

		return sellingAnnoInter.selectDataOne(se_no);
	}
	
	/* 조회수 처리 */
	@Override
	public boolean updateReadcnt(int se_no) {
		int result = sellingAnnoInter.updateReadcnt(se_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}
	
	/* 상품 등록 */
	@Override
	public boolean insertData(SellingBean bean) {
		int result = sellingAnnoInter.insertData(bean);
		
		if(result > 0) 
			return true;
		else
			return false;
	}

	/* 상품 수정 */
	@Override
	public boolean updateData(SellingBean bean) {
		int result = sellingAnnoInter.updateData(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 상품 삭제 */
	@Override
	public boolean deleteData(int se_no) {
		int result = sellingAnnoInter.deleteData(se_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 상품 검색 */
	@Override
	public List<SellingDto> search(String searchValue) {
		
		return sellingAnnoInter.search(searchValue);
	}
	
	/* 코멘트 불러오기 */
	@Override
	public List<SellingDto> selectCommentAll(int se_no) {
		
		return sellingAnnoInter.selectCommentAll(se_no);
	}
	
	/* 코멘트 등록 */
	@Override
	public boolean insertComment(SellingBean bean) {
		int result = sellingAnnoInter.insertComment(bean);
		
		if(result > 0) 
			return true;
		else
			return false;
	}
	
	/* 코멘트 수정 */
	@Override
	public boolean updateComment(SellingBean bean) {
		int result = sellingAnnoInter.updateComment(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 코멘트 삭제 */
	@Override
	public boolean deleteComment(int co_no) {
		int result = sellingAnnoInter.deleteComment(co_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}

}
