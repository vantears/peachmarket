package kr.ph.peach.vo;

import java.util.Date;

import lombok.Data;

@Data

public class TradeMessageVO {
	private int tm_num, tm_sb_num, tm_me_num;
	private String tm_info;
	private Date tm_date;
}
