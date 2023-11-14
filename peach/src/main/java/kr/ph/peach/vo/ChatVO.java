package kr.ph.peach.vo;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatVO {
	private int ch_num, ch_sb_num, ch_me_num;
	private String ch_seller_nickname, ch_buyer_nickname, ch_sb_name, ch_last_date;
	private int unreadCount;
	
	List<MessageVO> messageVO;
	
	public String get_last_date() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(ch_last_date, formatter);
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
