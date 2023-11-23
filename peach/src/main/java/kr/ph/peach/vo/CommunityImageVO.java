package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityImageVO {
	private int ci_num;
	private String ci_name;
	private int ci_co_num;
	private String ci_ori_name;


	public CommunityImageVO(int ci_co_num, String ci_name, String ci_ori_name) {
		this.ci_co_num = ci_co_num;
		this.ci_name = ci_name;
		this.ci_ori_name = ci_ori_name;
	}

}