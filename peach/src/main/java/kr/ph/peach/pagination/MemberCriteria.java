package kr.ph.peach.pagination;

import lombok.Data;

@Data
public class MemberCriteria extends Criteria{
	//type엔 어떤 방법으로 검색할지
	//search엔 회원 아이디
	String authority; //어떤 권한을 조회할지


	public MemberCriteria() {
		authority = "0";

	}





}