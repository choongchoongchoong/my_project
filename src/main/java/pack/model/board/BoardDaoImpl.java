package pack.model.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.board.BoardBean;

@Repository
public class BoardDaoImpl implements BoardDaoInter{
	@Autowired
	public BoardAnnoInter boardAnnoInter;  //SQL문이 담긴 어노테이션 관리 인터페이스
	
	/* 게시글 전체리스트 불러오기 */
	@Override
	public List<BoardDto> selectDataAll() {
		
		return boardAnnoInter.selectDataAll();
	}
	
	/* 글내용 상세보기 */
	@Override
	public BoardDto selectDataOne(int bd_no) {
		
		return boardAnnoInter.selectDataOne(bd_no);
	}

	/* 조회수 처리 */
	@Override
	public boolean updateReadcnt(int bd_no) {
		int result = boardAnnoInter.updateReadcnt(bd_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}
	
	/* 게시글 추가 */
	@Override
	public boolean insertData(BoardBean bean) {
		int result = boardAnnoInter.insertData(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 게시글 수정 */
	@Override
	public boolean updateData(BoardBean bean) {
		int result = boardAnnoInter.updateData(bean);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 게시글 삭제 */
	@Override
	public boolean deleteData(int bd_no) {
		int result = boardAnnoInter.deleteData(bd_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}

	/* 게시글 검색 */
	@Override
	public List<BoardDto> search(BoardBean bean) {
		
		return boardAnnoInter.search(bean);
	}





}
