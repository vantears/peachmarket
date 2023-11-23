package kr.ph.peach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.WishVO;


public interface SaleBoardService {

	List<SaleBoardVO> getSaleBoardList(SaleBoardCriteria cri, MemberVO user);
	int getTotalCount(SaleBoardCriteria cri);

	boolean insertBoard(SaleBoardVO saleBoard, MemberVO user, MultipartFile[] files);

	List<SaleCategoryVO> selectAllCategory();

	List<SaleBoardVO> selectAllBoard();

	String selectMemberNickname(int sb_me_num);

	SaleBoardVO selectBoard(Integer sb_num);

	String selectCategoryName(int sb_sc_num);

	int selectMemberSugar(int sb_me_num);

	boolean updateBoard(SaleBoardVO board, MemberVO user, MultipartFile[] files, Integer[] delFiles);

	boolean deleteBoard(Integer sb_num, MemberVO user);

	void insertWish(WishVO wish);

	WishVO selectWish(int wi_me_num, int wi_sb_num);

	void deleteWish(WishVO wish);

	List<SaleBoardVO> getMainSaleBoardList(SaleBoardCriteria cri);

	List<SaleImageVO> getFileList(Integer sb_num);

	List<SaleBoardVO> selectAllBoard2(SaleBoardCriteria cri);

	boolean adminDeleteBoard(Integer sb_num, MemberVO user);



}
