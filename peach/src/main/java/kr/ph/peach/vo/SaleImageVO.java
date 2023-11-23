package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleImageVO {
	private int si_num, si_key;
	private String si_name, si_thb_name, si_table;

	public SaleImageVO(int si_num, String si_name, String si_thb_name, String si_table, int si_key) {
		this.si_num = si_num;
		this.si_name = si_name;
		this.si_thb_name = si_thb_name;
		this.si_table = si_table;
		this.si_key = si_key;
	}
	public SaleImageVO(String si_name, String si_thb_name, String si_table, int si_key) {
		this.si_name = si_name;
		this.si_thb_name = si_thb_name;
		this.si_table = si_table;
		this.si_key = si_key;
	}
	public SaleImageVO(String si_name, String si_table, int si_key) {
		this.si_name = si_name;
		this.si_table = si_table;
		this.si_key = si_key;
	}


}
