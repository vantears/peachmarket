package kr.ph.peach.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class MemberVO {
	private int me_num, me_sugar, me_st_num, me_ci_num, me_point;
	private String me_id, me_pw, me_name, me_acc, me_phone, me_nick, me_au, me_date, me_bk_name, me_city_name;
	
	private String me_session_id;
	private Date me_session_limit;
	
	private CityVO cityVO;
	private StatementVO statementVO;
	private BankVO bankVO;
	
	private boolean autoLogin;
	
	@JsonIgnore
	public String getme_date_str() {
		if(me_date == null) {
			return "";
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(me_date);
	}

}
