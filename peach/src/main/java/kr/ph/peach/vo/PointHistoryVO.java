package kr.ph.peach.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data

public class PointHistoryVO {
	private int ph_num, ph_me_num, ph_point;
	private String ph_info;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date ph_date;
	private String formattedPhDate;

	public void setFormattedPhDate(String formattedDate) {
		this.formattedPhDate = formattedDate;
	}
}
