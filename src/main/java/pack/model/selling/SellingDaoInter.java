package pack.model.selling;

import java.util.List;

import pack.controller.selling.SellingBean;

public interface SellingDaoInter {
	List<SellingDto> selectDataAll();  //전체 판매 목록 불러오기
	boolean insertData(SellingBean bean);  //판매 등록
	
	/*
	SellingDto selectDataOne(String bd_no);  //게시글 하나 선택
	boolean updateData(BoardBean bean);  //글 수정
	boolean deleteData(String bd_no);  //글 삭제
	*/
}
