package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TradingVO {
	private int tr_tq_num, tr_cu, tr_se, tr_cancel_request;
	private String tr_ts_state;

}