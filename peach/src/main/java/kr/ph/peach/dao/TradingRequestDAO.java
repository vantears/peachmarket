package kr.ph.peach.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
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


}
