package kr.ph.peach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

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

	ProfileVO getPfText(MemberVO user);

	List<ProfileVO> getPF(MemberVO user);

	void updateText2(MemberVO user, List<ProfileVO> pfList);

	ProfileVO selectProfile(int me_num);

	ProfileImageVO selectImg(int pf_num);

	int selectIMG2(String pi_num);

	void addProfileNum(int me_num);

	void updateProductDate(SaleBoardVO saleBoard);


	
}
