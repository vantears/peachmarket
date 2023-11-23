package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingStateVO;
import kr.ph.peach.vo.TradingVO;

public interface TradingService {

	List<TradingVO> gettradingList(Criteria cri);

	List<TradingStateVO> getTradeTypeList();

}