package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

public interface SaleCategoryService {

	List<SaleCategoryVO> getSaleCategoryList();

	List<StatementVO> getMemberTypeList(MemberVO user);

	List<CommunityCategoryVO> getCommunityCategoryList();

	boolean insertSaleCategoryType(SaleCategoryVO saleCategory);

	boolean deleteSaleCategoryType(SaleCategoryVO saleCategory);

	boolean updateSaleCategoryType(SaleCategoryVO saleCategory);

	boolean insertCommunityCategoryType(CommunityCategoryVO communityCategory);

	boolean deleteCommunityCategoryType(CommunityCategoryVO communityCategory);

	boolean updateCommunityCategoryType(CommunityCategoryVO communityCategory);


}
