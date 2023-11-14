package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class WishVO {
	private int wi_num, wi_me_num, wi_sb_num;
	
	private MemberVO memberVO;
	private SaleBoardVO saleBoardVO;
	
	public WishVO(int wi_me_num, int wi_sb_num) {
		this.wi_me_num = wi_me_num;
		this.wi_sb_num = wi_sb_num;
	}

}
