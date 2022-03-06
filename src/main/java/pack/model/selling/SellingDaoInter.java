package pack.model.selling;

import java.util.List;

import pack.controller.selling.SellingBean;

public interface SellingDaoInter {
	List<SellingDto> selectDataAll();  //전체 판매 목록 불러오기
	List<SellingDto> selectDataMine(int user_no);  //나의 판매목록 불러오기
	SellingDto selectDataOne(int se_no);  //상품내용 상세보기
	boolean updateReadcnt(int se_no);  //조회수 처리
	
	boolean insertData(SellingBean bean);  //판매 등록
	
	/*
	boolean updateData(BoardBean bean);  //글 수정
	boolean deleteData(String bd_no);  //글 삭제
	*/
}
