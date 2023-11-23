package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	private int rp_key, rp_me_num, rp_num;
	private String rp_info, rp_table, rp_date;
	private MemberVO memberVO;
}
