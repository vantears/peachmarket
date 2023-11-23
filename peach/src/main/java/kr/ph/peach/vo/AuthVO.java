package kr.ph.peach.vo;

import java.util.Date;

import lombok.Data;

@Data

public class AuthVO {
	private int au_num;
	private String au_code;
	private Date au_time;
}
