package pack.model.board;

import java.util.List;

import pack.controller.board.BoardBean;

public interface BoardDaoInter {
	List<BoardDto> selectDataAll();  //게시글 리스트
	BoardDto selectDataOne(int bd_no);  //글내용 상세보기
	boolean updateReadcnt(int bd_no);  //조회수 처리
	
	boolean insertData(BoardBean bean);  //게시글 추가
	
	boolean updateData(BoardBean bean);  //글 수정
	boolean deleteData(int bd_no);  //글 삭제
	
	List<BoardDto> search(BoardBean bean);  //게시글 검색
	
}
