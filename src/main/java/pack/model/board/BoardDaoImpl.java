package pack.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.board.BoardBean;

@Repository
public class BoardDaoImpl implements BoardDaoInter{
	@Autowired
	public BoardAnnoInter boardAnnoInter;  //SQL문이 담긴 어노테이션 관리 인터페이스
	
	@Override
	public List<BoardDto> selectDataAll() {  //게시판 글 전체 목록 불러오기
		
		return boardAnnoInter.selectDataAll();
	}

	@Override
	public BoardDto selectDataOne(String bd_no) {  //게시글 하나 선택
		
		return boardAnnoInter.selectDataOne(bd_no);
	}

	@Override
	public boolean insertData(BoardBean bean) {  //글 추가
		int re = boardAnnoInter.insertData(bean);
		
		if(re > 0) 
			return true;
		else
			return false;
	}

	@Override
	public boolean updateData(BoardBean bean) {  //글 수정
		int re = boardAnnoInter.updateData(bean);
		
		if(re > 0) 
			return true;
		else
			return false;
	}
	
	@Override
	public boolean deleteData(String bd_no) {  //글 삭제
		int re = boardAnnoInter.deleteData(bd_no);
		
		if(re > 0) 
			return true;
		else 
			return false;
	}

}
