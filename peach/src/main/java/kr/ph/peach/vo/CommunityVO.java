package kr.ph.peach.vo;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityVO {


	private int co_num, co_like, co_reply, co_me_num, co_cc_num, co_views;
	private String co_title, co_info, co_date, me_nick , cc_name;
	private int ci_num;
	private String ci_large, ci_medium, ci_small;
	
	public CommunityVO(int co_num, int co_like, int co_reply, int co_me_num, int co_cc_num, String co_title,
			String co_info, String co_date, int co_views) {
		this.co_num = co_num;
		this.co_like = co_like;
		this.co_reply = co_reply;
		this.co_me_num = co_me_num;
		this.co_cc_num = co_cc_num;
		this.co_title = co_title;
		this.co_info = co_info;
		this.co_date = co_date;
		this.co_views = co_views;
	}

	public CommunityVO(String co_title, String co_info, int co_me_num, int co_cc_num) {
		this.co_title = co_title;
		this.co_info = co_info;
		this.co_me_num = co_me_num;
		this.co_cc_num = co_cc_num;
	}
	
	public String get_date() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(co_date, formatter);
		LocalDateTime nowTime = LocalDateTime.now();
		Duration duration = Duration.between(dateTime, nowTime);
		long diff = duration.getSeconds();
		String standard = "";

		if(diff > 31103999) {
			diff = diff/31104000;
			standard = "년 전";
		} else if(diff > 2591999) {
			diff = diff/2592000;
			standard = "달 전";
		} else if(diff > 604799) {
			diff = diff/604800;
			standard = "주 전";
		} else if(diff > 86399) {
			diff = diff/86400;
			standard = "일 전";
		} else if(diff > 3599) {
			diff = diff/3600;
			standard = "시간 전";
		} else if(diff > 59) {
			diff = diff/60;
			standard = "분 전";

		} else {
			String finalDate = "방금 전";
			return finalDate;
		}

		String finalDate = diff+standard;
		return finalDate;
	}
}