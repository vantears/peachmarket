package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.CategoryDAO;
import kr.ph.peach.dao.MemberDAO;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

@Service
public class CategoryServiceImp implements CategoryService{

	@Autowired
	CategoryDAO categoryDao;

	@Autowired
	MemberDAO memberDao;

	@Override
	public List<SaleCategoryVO> getSaleCategoryList() {
		return categoryDao.selectSaleCategoryList();

	}

	@Override
	public List<StatementVO> getMemberTypeList(MemberVO user) {

		return memberDao.selectMemberTypeList();
	}

	@Override
	public List<CommunityCategoryVO> getCommunityCategoryList() {

		return categoryDao.selectCommunityCategoryList();
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
			boolean res = categoryDao.insertSaleCategoryType(saleCategory);
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
		int count = categoryDao.selectupdateSaleCategoryTypeCountBySaleCategory(saleCategory.getSc_num());
		//있으면 삭제 실패
		if(count != 0) {
			return false;
		}
		//등록된 게시판 타입이 몇개 있는지 확인
		int scCount = categoryDao.selectSaleCategoryTypeCount();

		//1개 있으면 삭제 실패
		if(scCount == 1) {
			return false;
		}
		//게시판 타입을 삭제
		return categoryDao.deleteSaleCategoryType(saleCategory.getSc_num());
	}

	@Override
	public boolean updateSaleCategoryType(SaleCategoryVO saleCategory) {
		if(saleCategory == null || saleCategory.getSc_name() == null) {
			return false;
		}
		try {
			return categoryDao.updateSaleCategoryType(saleCategory);
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
			boolean res = categoryDao.insertCommunityCategoryType(communityCategory);
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
		int count = categoryDao.selectCommunityCategoryTypeCountByCommunityCategory(communityCategory.getCc_num());
		//있으면 삭제 실패
		if(count != 0) {
			return false;
		}
		//등록된 게시판 타입이 몇개 있는지 확인
		int ccCount = categoryDao.selectCommunityCategoryTypeCount();

		//1개 있으면 삭제 실패
		if(ccCount == 1) {
			return false;
		}
		//게시판 타입을 삭제
		return categoryDao.deleteCommunityCategoryType(communityCategory.getCc_num());
	}

	@Override
	public boolean updateCommunityCategoryType(CommunityCategoryVO communityCategory) {
		if(communityCategory == null || communityCategory.getCc_name() == null) {
			return false;
		}
		try {
			return categoryDao.updateCommunityCategoryType(communityCategory);
		}catch(Exception e) {
			return false;
		}
	}



}
