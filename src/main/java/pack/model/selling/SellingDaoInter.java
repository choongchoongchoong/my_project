package pack.model.selling;

import java.util.List;

import pack.controller.selling.SellingBean;

public interface SellingDaoInter {
	List<SellingDto> selectDataAll();  //전체 판매 목록 불러오기
	List<SellingDto> selectDataMine(int user_no);  //나의 판매목록 불러오기
	SellingDto selectDataOne(int se_no);  //상품내용 상세보기
	boolean updateReadcnt(int se_no);  //조회수 처리
	
	boolean insertData(SellingBean bean);  //상품 등록
	boolean updateData(SellingBean bean);  //상품 수정
	boolean deleteData(int se_no);  //상품 삭제
	
	List<SellingDto> search(String searchValue);  //상품 검색
	
	List<SellingDto> selectCommentAll(int se_no);  //코멘트 불러오기
	boolean insertComment(SellingBean bean);  //코멘트 등록
	boolean updateComment(SellingBean bean);  //코멘트 수정
	boolean deleteComment(int co_no);  //코멘트 삭제
	
}
