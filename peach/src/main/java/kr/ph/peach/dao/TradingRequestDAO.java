package kr.ph.peach.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingRequestVO;

public interface TradingRequestDAO {

	List<TradingRequestVO> getTradingRequest(@Param("user")MemberVO user);

	boolean deleteTradingRequest(@Param("tq_num")int tq_num, @Param("model")Model model, @Param("session")HttpSession session);

	boolean tradePost(@Param("tq_sb_num")int tq_sb_num, @Param("tq_me_num")int tq_me_num);

	List<TradingRequestVO> getTradingRequestList();

	void changeTradingState(@Param("tq_num")int tq_num);

	void makingTrading(@Param("tq_num")int tq_num);

	List<TradingRequestVO> getTradingNow(@Param("user")MemberVO user, @Param("tq_num")Integer tq_num);

	void changeTradingCuState(@Param("tq_num")int tq_num);

	void changeTradingSeState(@Param("tq_num")int tq_num);

	boolean getTradingRequestPeach(@Param("user")MemberVO user, @Param("sb_num")int sb_num);

	void reducePoint(@Param("me_num")int me_num, @Param("me_point")int me_point);

	void addPointToCustomer(@Param("tq_num")int tq_num);

	void reducePointToCustomer(@Param("tq_num")int tq_num);

	void changeTradingSeStateCancel(@Param("tq_num")int tq_num);

	void changeTradingCuStateCancel(@Param("tq_num")int tq_num);

	void changeTrTqState(@Param("tq_num")int tq_num);

	TradingRequestVO getTradingRequestThat(@Param("tq_num")int tq_num);

	/* void deleteTradingRequest(@Param("tq_num")int tq_num); */

	List<TradingRequestVO> getTradingNowList();
	
	boolean deleteTradeReportNum(@Param("rp_key")int rp_key);
}
