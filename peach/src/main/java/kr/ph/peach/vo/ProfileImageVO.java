package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProfileImageVO {
	private int pi_num, pi_pf_num, pf_num;
	private String pi_name;

	public ProfileImageVO(int pi_num, String pi_name, int pi_pf_num) {
		this.pi_num = pi_num;
		this.pi_name = pi_name;
		this.pi_pf_num = pi_pf_num;
	}

	public ProfileImageVO(String pi_name, int pf_num) {
		this.pi_name = pi_name;
		this.pf_num = pf_num;
	}

}