package kr.ph.peach.vo;

import java.text.DecimalFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleBoardVO {
	private int sb_num, sb_wish, sb_price, sb_me_num, sb_ss_num, sb_sc_num, sb_me_sugar, tr_tq_num;
	private String sb_name, sb_info, sb_me_nickname, sb_sc_name;
	private String sb_date;
	private SaleCategoryVO saleCategoryVO;
	private List<SaleImageVO> saleImageVOList;
	private MemberVO memberVO;
	private CityVO cityVO;
		
	public SaleBoardVO(String sb_name, int sb_price, String sb_info, int sb_sc_num) {
		this.sb_name = sb_name;
		this.sb_price = sb_price;
		this.sb_info = sb_info;
		this.sb_sc_num = sb_sc_num;
	}

	public String get_sb_price() {
		DecimalFormat decFormat = new DecimalFormat("###,###");
		return decFormat.format(this.sb_price);
	}

	public String get_date() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime dateTime = LocalDateTime.parse(sb_date, formatter);
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
