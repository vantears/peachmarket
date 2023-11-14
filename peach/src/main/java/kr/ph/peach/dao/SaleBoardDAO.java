package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.vo.SaleBoardVO;

import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.WishVO;


public interface SaleBoardDAO {

	boolean insertBoard(@Param("saleBoard")SaleBoardVO saleBoard);

	List<SaleBoardVO> selectSaleBoardList(@Param("cri")SaleBoardCriteria cri);
	
	List<SaleCategoryVO> selectAllCategory();

	List<SaleBoardVO> selectAllBoard();
	
	List<SaleBoardVO> selectAllBoard2(@Param("cri")SaleBoardCriteria cri);

	String selectMemberNickname(int sb_me_num);

	SaleBoardVO selectBoard(Integer sb_num);

	String selectCategoryName(int sb_sc_num);

	int selectMemberSugar(int sb_me_num);

	int getTotalCount(@Param("cri")SaleBoardCriteria cri);
	
	void updateBoard(@Param("board")SaleBoardVO board);

	void deleteBoard(Integer sb_num);

	void insertWish(@Param("wish")WishVO wish);

	WishVO selectWish(@Param("wi_me_num")int wi_me_num, @Param("wi_sb_num")int wi_sb_num);

	void deleteWish(@Param("wish")WishVO wish);

	void updateWish(@Param("wi_sb_num")int wi_sb_num, @Param("i")int i);

	List<SaleBoardVO> selectMainSaleBoardList(@Param("cri")SaleBoardCriteria cri);

	void insertFile(@Param("saleImage")SaleImageVO saleImage);

	List<SaleImageVO> selectFileList(@Param("si_table")String si_table, @Param("sb_num")Integer sb_num);

	void deleteAllWish(Integer sb_num);

	SaleImageVO selectFile(Integer num);

	void deleteFile(Integer num);

}
