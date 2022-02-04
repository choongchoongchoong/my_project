package pack.model.board;

import java.util.List;

import pack.controller.board.BoardBean;

public interface BoardDaoInter {
	List<BoardDto> selectDataAll();  //게시판 글 전체 목록 불러오기
	BoardDto selectDataOne(String bd_no);  //게시글 하나 선택
	boolean insertData(BoardBean bean);  //글 추가
	boolean updateData(BoardBean bean);  //글 수정
	boolean deleteData(String bd_no);  //글 삭제
}
