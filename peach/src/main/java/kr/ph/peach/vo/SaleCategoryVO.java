package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class SaleCategoryVO {

	private int sc_num;
	private String sc_name;
	
}
