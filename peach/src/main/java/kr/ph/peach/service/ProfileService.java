package kr.ph.peach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.SugarListVO;

public interface ProfileService {

	List<SaleBoardVO> getProductsById(int me_num, int state);

	List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num);

	void dateUp(Integer sb_num);

	boolean deletePD(Integer sb_num);

	List<CityVO> getLargeCity();

	List<CityVO> getMediumCity(String large);

	List<CityVO> getSmall(String medium);

	boolean updateProfile(MemberVO user, MultipartFile[] files, MultipartFile Original);

	void updateCity(MemberVO user, int me_ci_num);

	void updateText(MemberVO user, String pf_text);

	ProfileVO getPfText(int meNum);

	List<ProfileVO> getPF(MemberVO user);

	void updateText2(MemberVO user, List<ProfileVO> pfList);

	ProfileVO selectProfile(int me_num);

	ProfileImageVO selectImg(int pf_num);

	int selectIMG2(String pi_num);

	void addProfileNum(int me_num);

	void updateProductDate(SaleBoardVO saleBoard);

	ProfileImageVO selectOriFile(MemberVO user);

	MemberVO getAccount(MemberVO user);

	boolean updateWithdraw(int PPoint, MemberVO user);

	int selectPoint(int me_num);

	List<SaleBoardVO> selectBuy(int me_num);

	List<SaleBoardVO> selectSel(int me_num);

	List<SaleBoardVO> selectProceeding(int me_num);

	MemberVO getUserById(String me_id);

	CityVO selectUserCity(MemberVO user);

	boolean insertSugar(SugarListVO sugarList, MemberVO user);

	SugarListVO selectSugar(SugarListVO sugarList, MemberVO user);

	int selectTrTqNum(int sb_num);

	Integer selectSugarContent(int meNum);

	void updateSugar(Integer sugarContent, int meNum);

	int selectSellUser(SugarListVO sugarList);

	
}