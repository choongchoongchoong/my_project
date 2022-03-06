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
	public List<BoardDto> selectDataAll() {  //게시판 글 전체 불러오기
		
		return boardAnnoInter.selectDataAll();
	}
	
	@Override
	public BoardDto selectDataOne(int bd_no) {  //글내용 상세보기
		
		return boardAnnoInter.selectDataOne(bd_no);
	}

	@Override
	public boolean updateReadcnt(int bd_no) {  //조회수 처리
		int result = boardAnnoInter.updateReadcnt(bd_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}
	
	@Override
	public boolean insertData(BoardBean bean) {  //게시글 추가
		int result = boardAnnoInter.insertData(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateData(BoardBean bean) {  //게시글 수정
		int result = boardAnnoInter.updateData(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteData(int bd_no) {  //게시글 삭제
		int result = boardAnnoInter.deleteData(bd_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public List<BoardDto> search(BoardBean bean) {  //게시글 검색
		
		return boardAnnoInter.search(bean);
	}





}
