package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.TradeMessageDAO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradeMessageVO;
import kr.ph.peach.vo.TradingRequestVO;

@Service
public class TradeMessageServiceImp implements TradeMessageService {

	@Autowired
	TradeMessageDAO tradeMessageDao;

	@Override
	public void rejectMessageToCustomer(TradingRequestVO trv) {
		tradeMessageDao.rejectMessageToCustomer(trv);
	}

	@Override
	public List<TradeMessageVO> getTradeMessageList(MemberVO user) {
		return tradeMessageDao.getTradeMessageList(user);
	}

	@Override
	public void confirmPost(int tm_num) {
		tradeMessageDao.confirmPost(tm_num);
		
	}

	@Override
	public void acceptMessageToCustomer(TradingRequestVO trv) {
		tradeMessageDao.acceptMessageToCustomer(trv);
	}
	
}