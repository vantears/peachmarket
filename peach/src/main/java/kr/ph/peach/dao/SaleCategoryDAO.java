package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.SaleCategoryVO;

public interface SaleCategoryDAO {


	List<SaleCategoryVO> selectSaleCategoryList();
	
	List<CommunityCategoryVO> selectCommunityCategoryList();
	
	
	/*
	 * 물품 카테고리 관련
	 * */

	boolean insertSaleCategoryType(@Param("sc")SaleCategoryVO saleCategory);

	int selectupdateSaleCategoryTypeCountBySaleCategory(@Param("sb_sc_num")int sc_num);

	int selectSaleCategoryTypeCount();

	boolean deleteSaleCategoryType(@Param("sc_num")int sc_num);

	boolean updateSaleCategoryType(@Param("sc")SaleCategoryVO saleCategory);
	
	
	/*
	 * 커뮤니티 카테고리 관련
	 * */
	

	boolean insertCommunityCategoryType(@Param("cc")CommunityCategoryVO communityCategory);

	int selectCommunityCategoryTypeCountByCommunityCategory(@Param("co_cc_num")int cc_num);

	int selectCommunityCategoryTypeCount();

	boolean deleteCommunityCategoryType(@Param("cc_num")int cc_num);

	boolean updateCommunityCategoryType(@Param("cc")CommunityCategoryVO communityCategory);

}
