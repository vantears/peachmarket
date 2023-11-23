package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.TradingDAO;
import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingStateVO;
import kr.ph.peach.vo.TradingVO;

@Service
public class TradingServiceImp implements TradingService{

	@Autowired
	TradingDAO tradingDao;
	
	@Override
	public List<TradingVO> gettradingList(Criteria cri) {
		
		return tradingDao.gettradingList(cri);
	}

	@Override
	public List<TradingStateVO> getTradeTypeList() {
		
		return tradingDao.getSelectTypeList();
	}

}