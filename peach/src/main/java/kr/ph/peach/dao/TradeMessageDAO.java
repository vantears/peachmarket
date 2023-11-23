package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradeMessageVO;
import kr.ph.peach.vo.TradingRequestVO;

public interface TradeMessageDAO {

	void rejectMessageToCustomer(@Param("trv")TradingRequestVO trv);

	List<TradeMessageVO> getTradeMessageList(@Param("user")MemberVO user);

	void confirmPost(@Param("tm_num")int tm_num);

	void acceptMessageToCustomer(@Param("trv")TradingRequestVO trv);

	
}