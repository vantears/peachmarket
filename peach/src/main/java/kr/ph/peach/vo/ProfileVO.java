package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;


//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class ProfileVO {
	private int pf_num, pf_me_num;
	private String pf_text;

	public ProfileVO(int pf_num,int pf_me_num, String pf_text) {
		this. pf_num = pf_num;
		this. pf_me_num = pf_me_num;
		this. pf_text = pf_text;
	}
}
