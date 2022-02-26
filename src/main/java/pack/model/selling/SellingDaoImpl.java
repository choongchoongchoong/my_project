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
	public List<SellingDto> selectDataAll() {
		
		return sellingAnnoInter.selectDataAll();
	}

	@Override
	public boolean insertData(SellingBean bean) {
		int re = sellingAnnoInter.insertData(bean);
		
		if(re > 0) 
			return true;
		else
			return false;
	}


}
