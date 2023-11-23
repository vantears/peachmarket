package kr.ph.peach.vo;

import lombok.Data;

@Data
public class TradingRequestVO {
	private int tq_num, tq_sb_num, tq_me_num, tq_as_num, tq_trade_type;
	private SaleBoardVO saleBoardVO;
	private MemberVO memberVO;
	private SaleCategoryVO saleCategoryVO;
	private TradingVO tradingVO;
	private TradeMessageVO tradeMessageVO;
}