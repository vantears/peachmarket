package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.StatementVO;
import kr.ph.peach.vo.WishVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("user")MemberVO user);
	
	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

	List<CityVO> selectLargeCity();

	List<CityVO> selectMediumCity(@Param("large")String large);

	List<CityVO> selectSmallCity(@Param("medium")String medium);
	
	List<BankVO> selectBank();

	MemberVO selectMemberByNickName(@Param("nick")String me_nick);
	
	MemberVO selectMemberByPhoneNum(@Param("phone")String me_phone);
	
	MemberVO selectMemberByAcc(@Param("acc")String me_acc);

	MemberVO getMemberByNumber(@Param("meNum")int meNum);

	MemberVO selectMemberByName(@Param("name")String me_name);
	//---------------------아이디 찾기 -------
	MemberVO memberIdFind(MemberVO member);

	MemberVO selectMemberBySession(@Param("session_id")String session_id);
	
	List<WishVO> getsaleBoardWishList(@Param("me_num")int me_num);

	List<MemberVO> getMemberList(@Param("cri")MemberCriteria cri);

	int getTotalCount(@Param("cri")MemberCriteria cri);

	List<StatementVO> selectMemberTypeList();

	boolean updateState(@Param("me_num")int me_num, @Param("me_st_num")int me_st_num);

	CityVO selectCity(int me_ci_num);
	
}