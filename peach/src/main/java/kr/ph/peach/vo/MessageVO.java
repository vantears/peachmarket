package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MessageVO {
	private int ms_num, ms_me_num, ms_ch_num, ms_unread;
	private String ms_info, ms_date;

}
