package kr.ph.peach.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingRequestVO;

public interface TradingRequestService {

	List<TradingRequestVO> getTradingRequestList(MemberVO user);

	boolean deleteTradingRequest(int tq_num, Model model, HttpSession session);

	boolean tradePost(int tq_sb_num, int tq_me_num);

	List<TradingRequestVO> getTradingRequestList();

	void changeTradingState(int tq_num);

	void makingTrading(int tq_num);

	List<TradingRequestVO> getTradingRequests(MemberVO user, Integer tq_num);

	void changeTradingCuState(int tq_num);

	void changeTradingSeState(int tq_num);

	boolean getTradingRequestPeach(MemberVO user, int sb_num);

	void reducePoint(int me_num, int me_point);

	void addPointToCustomer(int tq_num);

	void reducePointToCustomer(int tq_num);

	void changeTradingSeStateCancel(int tq_num);

	void changeTradingCuStateCancel(int tq_num);

	TradingRequestVO getTradingRequestThat(int tq_num);
	
	List<TradingRequestVO> getTradingRequestsList();

}