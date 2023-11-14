package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.WishVO;

public interface MemberService {

	boolean signup(MemberVO member);
	
	boolean checkId(String id);
	
	boolean checkNick(String nick);

	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);

	MemberVO getMemberBySession(String session_id);
	
	MemberVO getMemberBySessionId(String value);
	
	List<CityVO> getLargeCity();

	List<CityVO> getMediumCity(String large);


	List<CityVO> getSmall(String medium);
	
	List<BankVO> getBank();

	MemberVO getMemberByNumber(int meNum);
	
	MemberVO selectMemberByPhoneNum(String me_phone);

	MemberVO selectMemberByAcc(String me_acc);
	//---------------아이디 찾기-----------------
	MemberVO memberIdFind(MemberVO member);

	boolean sendPw(String me_id, String me_name);
	
	List<WishVO> getWishList(int me_num);

	List<MemberVO> getMemberList(MemberCriteria cri);

	int getTotalCount(MemberCriteria cri);

	boolean updateState(int me_num, int me_st_num);

	CityVO selectCity(int me_ci_num);
	
}
