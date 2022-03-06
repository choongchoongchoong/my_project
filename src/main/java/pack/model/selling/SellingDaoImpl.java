package pack.model.selling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.selling.SellingBean;

@Repository
public class SellingDaoImpl implements SellingDaoInter{
	@Autowired
	public SellingAnnoInter sellingAnnoInter;  //SQL문이 담긴 어노테이션 관리 인터페이스

	@Override
	public List<SellingDto> selectDataAll() {  //전체 판매 목록 불러오기
		
		return sellingAnnoInter.selectDataAll();
	}

	@Override
	public List<SellingDto> selectDataMine(int user_no) {  //나의 판매목록 불러오기
		
		return sellingAnnoInter.selectDataMine(user_no);
	}
	
	@Override
	public SellingDto selectDataOne(int se_no) {  //상품내용 상세보기

		return sellingAnnoInter.selectDataOne(se_no);
	}
	
	@Override
	public boolean updateReadcnt(int se_no) {  //조회수 처리
		int result = sellingAnnoInter.updateReadcnt(se_no);
		
		if(result > 0)
			return true;
		else
			return false;
	}
	
	@Override
	public boolean insertData(SellingBean bean) {  //판매 등록
		int result = sellingAnnoInter.insertData(bean);
		
		if(result > 0) 
			return true;
		else
			return false;
	}



}
