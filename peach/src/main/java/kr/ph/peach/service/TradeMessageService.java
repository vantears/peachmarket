package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.TradeMessageVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingRequestVO;

public interface TradeMessageService {

	void rejectMessageToCustomer(TradingRequestVO trv);

	List<TradeMessageVO> getTradeMessageList(MemberVO user);

	void confirmPost(int tm_num);

	void acceptMessageToCustomer(TradingRequestVO trv);

}