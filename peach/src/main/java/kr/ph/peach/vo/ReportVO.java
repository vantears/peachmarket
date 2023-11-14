package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	private int key, me_num;
	private String info, table, date;

}
