package kr.ph.peach.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.ProfileDAO;
import kr.ph.peach.util.UploadFileUtils;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.SugarListVO;

@Service
public class ProfileServiceImp implements ProfileService{

	@Autowired
	private ProfileDAO profileDao;

	String uploadPath = "C:\\finalImg\\img";

	@Override
	public List<SaleBoardVO> getProductsById(int me_num, int state) {
		 List<SaleBoardVO> products = profileDao.getProductsById(me_num, state);

		 return products;
	}

	@Override
	public List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num) {
		 List<SaleCategoryVO> category = profileDao.getCategoriesByScNum(sb_sc_num);
		    return category;
	}

	@Override
	public void dateUp(Integer sb_num) {
		profileDao.dateUp(sb_num);
	}

	@Override
	public boolean deletePD(Integer sb_num) {
		if(sb_num == null) {
			return false;
		}else {

		//게시글 삭제
		profileDao.deleteBoard(sb_num);}
		return true;
	}

	@Override
	public List<CityVO> getMediumCity(String large) {
		return profileDao.selectMediumCity(large);
	}

	@Override
	public List<CityVO> getSmall(String medium) {
		return profileDao.selectSmallCity(medium);
	}

	@Override
	public List<CityVO> getLargeCity() {
		return profileDao.selectLargeCity();
	}

	@Override
	public boolean updateProfile(MemberVO user, MultipartFile[] files, MultipartFile Original) {
		if(user == null) {
			return false;
		}
		profileDao.updateUserId(user);
		profileDao.updateUserPw(user);

		if(files == null || files.length == 0) {
			return true;
		}

		uploadFileAndInsert(files, user.getMe_num(), Original);

		return true;
	}

	private void uploadFileAndInsert(MultipartFile[] files, int me_num, MultipartFile Original) {
		if(files == null || files.length == 0) {
			return;
		}
		ProfileVO pf_num2 = profileDao.selectProfile(me_num);

		ProfileImageVO pfIMG = profileDao.selectImg(pf_num2.getPf_num());

		if(pfIMG != null && Original == null) {
			profileDao.deleteIMG(pfIMG.getPi_pf_num());
		}


		int pf_num = pf_num2.getPf_num();
		
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String pi_name = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				ProfileImageVO profileImage = new ProfileImageVO(pi_name,pf_num);
				profileDao.insertProfileFile(profileImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}


	@Override
	public void updateCity(MemberVO user, int me_ci_num) {
		profileDao.updateCity(user, me_ci_num);
	}

	@Override
	public void updateText(MemberVO user, String pf_text) {
		profileDao.updateText(user, pf_text);
	}

	@Override
	public ProfileVO getPfText(int meNum) {
		
		return profileDao.selectPfText(meNum);
	}

	@Override
	public List<ProfileVO> getPF(MemberVO user) {
		return profileDao.getPF(user);
	}

	@Override
	public void updateText2(MemberVO user, List<ProfileVO> pfList) {
		profileDao.updateText2(user, pfList);
	}

	@Override
	public ProfileVO selectProfile(int me_num) {
		if(me_num == 0) {
			return null;
		}
		return profileDao.selectProfile(me_num);
	}

	@Override
	public ProfileImageVO selectImg(int pf_num) {
		if(pf_num == 0) {
			return null;
		}
		return profileDao.selectImg(pf_num);
	}

	@Override
	public int selectIMG2(String pi_num) {
		return profileDao.selectIMG2(pi_num);
	}

	@Override
	public void addProfileNum(int me_num) {
		profileDao.addProfileNum(me_num);

	}

	@Override
	public void updateProductDate(SaleBoardVO saleBoard) {
		if(saleBoard == null) {
			return;
		}
		profileDao.updateBoardViews(saleBoard);

	}

	@Override
	public ProfileImageVO selectOriFile(MemberVO user) {
		ProfileImageVO OriFile = profileDao.selectOriFile(user);
		return OriFile;
	}

	@Override
	public MemberVO getAccount(MemberVO user) {
		MemberVO member = profileDao.getAccount(user);
		return member;
	}

	@Override
	public boolean updateWithdraw(int PPoint, MemberVO user) {
		if(user != null) {
		profileDao.updateWithdraw(PPoint, user);
		return true;
		}else {
			return false;
		}
	}

	@Override
	public int selectPoint(int me_num) {
		return profileDao.selectPoint(me_num);
	}

	@Override
	public List<SaleBoardVO> selectBuy(int me_num) {
		List<SaleBoardVO> meNumBuy = profileDao.selectBuy(me_num);
		return meNumBuy;
	}

	@Override
	public List<SaleBoardVO> selectSel(int me_num) {
		List<SaleBoardVO> meNumSel = profileDao.selectSel(me_num);
		return meNumSel;
	}

	@Override
	public List<SaleBoardVO> selectProceeding(int me_num) {
		List<SaleBoardVO> Proceeding = profileDao.selectProceeding(me_num);
		return Proceeding;
	}

	@Override
	public MemberVO getUserById(String me_id) {
		MemberVO user = profileDao.getUserById(me_id);
		return user;
	}

	@Override
	public CityVO selectUserCity(MemberVO user) {
		CityVO userCity = profileDao.selectUserCity(user);
		return userCity;
	}

	@Override
	public boolean insertSugar(SugarListVO sugarList, MemberVO user) {
		if(sugarList == null) {
			return false;
		}
		profileDao.insertReport(sugarList, user);
		return true;
	}

	@Override
	public SugarListVO selectSugar(SugarListVO sugarList, MemberVO user) {
		SugarListVO sgRes = profileDao.selectSugar(sugarList,user);
		return sgRes;
	}

	@Override
	public int selectTrTqNum(int sb_num) {
		if(sb_num == 0 ) {
			return 0;
		}
		return profileDao.selectTrTqNum(sb_num);
	}

	@Override
	public Integer selectSugarContent(int meNum) {
		Integer sugarContent = profileDao.selectSugarContent(meNum);
		return sugarContent;
	}

	@Override
	public void updateSugar(Integer sugarContent, int meNum) {
		if(sugarContent == null) {
			return;
		}
		
		profileDao.updateSugar(sugarContent, meNum);
		
	}

	@Override
	public int selectSellUser(SugarListVO sugarList) {
		int sellUser = profileDao.selectSellUser(sugarList);
		return sellUser;
	}

	
}