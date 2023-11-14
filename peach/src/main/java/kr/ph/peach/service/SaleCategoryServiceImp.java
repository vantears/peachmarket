package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.MemberDAO;
import kr.ph.peach.dao.SaleCategoryDAO;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

@Service
public class SaleCategoryServiceImp implements SaleCategoryService{

	@Autowired
	SaleCategoryDAO saleCategoryDao;
  
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public List<SaleCategoryVO> getSaleCategoryList() {
		return saleCategoryDao.selectSaleCategoryList();

	}
	@Override
	public List<StatementVO> getMemberTypeList(MemberVO user) {
		
		return memberDao.selectMemberTypeList();
	}

	@Override
	public List<CommunityCategoryVO> getCommunityCategoryList() {
		
		return saleCategoryDao.selectCommunityCategoryList();
	}
	
	
	/*
	 * 물품 카테고리 관련
	 * 
	 * */
	

	@Override
	public boolean insertSaleCategoryType(SaleCategoryVO saleCategory) {
		if(saleCategory == null || saleCategory.getSc_name() == null) {
			return false;
		}
		//카테고리명이 중복되는걸 방지하기 위해
		try {
			boolean res = saleCategoryDao.insertSaleCategoryType(saleCategory);
			if(!res) {
				return false;
			}
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteSaleCategoryType(SaleCategoryVO saleCategory) {
		if(saleCategory == null) {
			return false;
		}
		//등록된 게시글이 있는지 확인 
		int count = saleCategoryDao.selectupdateSaleCategoryTypeCountBySaleCategory(saleCategory.getSc_num());
		//있으면 삭제 실패
		if(count != 0) {
			return false;
		}
		//등록된 게시판 타입이 몇개 있는지 확인
		int scCount = saleCategoryDao.selectSaleCategoryTypeCount();
		
		//1개 있으면 삭제 실패 
		if(scCount == 1) {
			return false;
		}
		//게시판 타입을 삭제
		return saleCategoryDao.deleteSaleCategoryType(saleCategory.getSc_num());
	}

	@Override
	public boolean updateSaleCategoryType(SaleCategoryVO saleCategory) {
		if(saleCategory == null || saleCategory.getSc_name() == null) {
			return false;
		}
		try {
			return saleCategoryDao.updateSaleCategoryType(saleCategory);
		}catch(Exception e) {
			return false;
		}
	}

	
	
	/*
	 * 커뮤니티 카테고리 관련
	 * */
	
	@Override
	public boolean insertCommunityCategoryType(CommunityCategoryVO communityCategory) {
		if(communityCategory == null || communityCategory.getCc_name() == null) {
			return false;
		}
		//카테고리명이 중복되는걸 방지하기 위해
		try {
			boolean res = saleCategoryDao.insertCommunityCategoryType(communityCategory);
			if(!res) {
				return false;
			}
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteCommunityCategoryType(CommunityCategoryVO communityCategory) {
		if(communityCategory == null) {
			return false;
		}
		//등록된 게시글이 있는지 확인 
		int count = saleCategoryDao.selectCommunityCategoryTypeCountByCommunityCategory(communityCategory.getCc_num());
		//있으면 삭제 실패
		if(count != 0) {
			return false;
		}
		//등록된 게시판 타입이 몇개 있는지 확인
		int ccCount = saleCategoryDao.selectCommunityCategoryTypeCount();
		
		//1개 있으면 삭제 실패 
		if(ccCount == 1) {
			return false;
		}
		//게시판 타입을 삭제
		return saleCategoryDao.deleteCommunityCategoryType(communityCategory.getCc_num());
	}

	@Override
	public boolean updateCommunityCategoryType(CommunityCategoryVO communityCategory) {
		if(communityCategory == null || communityCategory.getCc_name() == null) {
			return false;
		}
		try {
			return saleCategoryDao.updateCommunityCategoryType(communityCategory);
		}catch(Exception e) {
			return false;
		}
	}

}
