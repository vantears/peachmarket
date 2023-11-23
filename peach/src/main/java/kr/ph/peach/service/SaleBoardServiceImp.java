package kr.ph.peach.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.ChatDAO;
import kr.ph.peach.dao.SaleBoardDAO;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.util.UploadFileUtils;
import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.WishVO;

@Service
public class SaleBoardServiceImp implements SaleBoardService {

	String uploadPath = "C:\\Users\\user1\\Documents\\workspace-sts-3.9.1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\peach\\resources\\image";
	//String uploadPath = "/Users/hojunlee/Documents/workspace-sts-3.9.18.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/peach/resources/image";

	@Autowired
	SaleBoardDAO saleBoardDao;

	@Autowired
	ChatDAO chatDao;

	@Override
	public List<SaleBoardVO> getSaleBoardList(SaleBoardCriteria cri, MemberVO user) {
		if (cri == null) {
			cri = new SaleBoardCriteria();
		}
		return saleBoardDao.selectSaleBoardList(cri, user);
	}

	@Override
	public int getTotalCount(SaleBoardCriteria cri) {
		if (cri == null) {
			cri = new SaleBoardCriteria();
		}
		return saleBoardDao.getTotalCount(cri);
	}

	@Override
	public boolean insertBoard(SaleBoardVO saleBoard, MemberVO user, MultipartFile[] files) {
		if ((user == null) || saleBoard == null || saleBoard.getSb_name() == null) {
			return false;
		}
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		saleBoard.setSb_date(formatedNow);
		saleBoard.setSb_me_num(user.getMe_num());

		if(!saleBoardDao.insertBoard(saleBoard)) {
			return false;
		}
		if(files == null || files.length == 0) {
			return true;
		}
		uploadFileAndInsert(files, saleBoard.getSb_num());

		return true;
	}

	private void uploadFileAndInsert(MultipartFile[] files, int sb_num) {
		if(files == null || files.length == 0) {
			return;
		}
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String si_table = "sale_board";
				String si_name = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				String si_thb_name = UploadFileUtils.createThumbnail(uploadPath, si_name, file.getBytes());
				SaleImageVO saleImage = new SaleImageVO(si_name, si_thb_name, si_table, sb_num);
				saleBoardDao.insertFile(saleImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
	    // Create a new File object using the original file name of the MultipartFile
	    File file = new File(multipartFile.getOriginalFilename());

	    // Transfer the contents of the MultipartFile to the new File
	    multipartFile.transferTo(file);

	    // Return the File
	    return file;
	}

	@Override
	public List<SaleCategoryVO> selectAllCategory() {

		return saleBoardDao.selectAllCategory();
	}

	@Override
	public List<SaleBoardVO> selectAllBoard() {

		return saleBoardDao.selectAllBoard();
	}

	@Override
	public List<SaleBoardVO> selectAllBoard2(SaleBoardCriteria cri) {

		return saleBoardDao.selectAllBoard2(cri);
	}

	@Override
	public String selectMemberNickname(int sb_me_num) {
		if (sb_me_num == 0) {
			return null;
		}
		return saleBoardDao.selectMemberNickname(sb_me_num);
	}

	@Override
	public SaleBoardVO selectBoard(Integer sb_num) {
		if (sb_num == null) {
			return null;
		}
		return saleBoardDao.selectBoard(sb_num);
	}

	@Override
	public String selectCategoryName(int sb_sc_num) {
		if (sb_sc_num == 0) {
			return null;
		}
		return saleBoardDao.selectCategoryName(sb_sc_num);
	}

	@Override
	public int selectMemberSugar(int sb_me_num) {
		if (sb_me_num == 0) {
			return 0;
		}
		return saleBoardDao.selectMemberSugar(sb_me_num);
	}

	@Override
	public boolean updateBoard(SaleBoardVO board, MemberVO user, MultipartFile[] files, Integer[] delFiles) {
		if (board == null || user == null || (user.getMe_num() != board.getSb_me_num())) {
			return false;
		}
		saleBoardDao.updateBoard(board);

		uploadFileAndInsert(files, board.getSb_num());
		deleteFile(delFiles);
		return true;
	}

	@Override
	public boolean deleteBoard(Integer sb_num, MemberVO user) {
		if ((sb_num == 0) || (user == null)) {
			return false;
		}
		SaleBoardVO board = saleBoardDao.selectBoard(sb_num);
		ChatVO chat = chatDao.selectChatBySbNum(sb_num);
		if(chat != null) {
			chatDao.deleteMessages(chat.getCh_num());
			chatDao.deleteChat(chat.getCh_num());
		}
		if(board == null || board.getSb_me_num() != user.getMe_num()) {
			return false;
		}
		List<SaleImageVO> fileList = board.getSaleImageVOList();
		deleteFile(fileList);
		saleBoardDao.deleteAllWish(sb_num);
		saleBoardDao.deleteBoard(sb_num);
		return true;
	}

	private void deleteFile(List<SaleImageVO> fileList) {
		if(fileList == null || fileList.size() == 0){
			return;
		}
		Integer [] nums = new Integer[fileList.size()];
		for(int i = 0; i < nums.length; i++) {
			nums[i] = fileList.get(i).getSi_num();
		}
		deleteFile(nums);

	}

	private void deleteFile(Integer[] nums) {
		if(nums == null || nums.length == 0) {
			return;
		}

		for(Integer num : nums) {
			if(num == null) {
				continue;
			}
			//첨부파일 정보를 가져옴
			SaleImageVO fileVo = saleBoardDao.selectFile(num);
			if(fileVo == null) {
				continue;
			}
			UploadFileUtils.deleteFile(uploadPath, fileVo.getSi_name(), fileVo.getSi_thb_name());
			//DB에서 제거
			saleBoardDao.deleteFile(num);
		}

	}

	@Override
	public void insertWish(WishVO wish) {
		if (wish == null) {
			return;
		}
		saleBoardDao.insertWish(wish);
		saleBoardDao.updateWish(wish.getWi_sb_num(), 1);
	}

	@Override
	public WishVO selectWish(int wi_me_num, int wi_sb_num) {
		if (wi_me_num == 0 || wi_sb_num == 0) {
			return null;
		}

		return saleBoardDao.selectWish(wi_me_num, wi_sb_num);
	}

	@Override
	public void deleteWish(WishVO wish) {
		if (wish == null) {
			return;
		}
		saleBoardDao.deleteWish(wish);
		saleBoardDao.updateWish(wish.getWi_sb_num(), -1);

	}

	@Override
	public List<SaleBoardVO> getMainSaleBoardList(SaleBoardCriteria cri) {
		if (cri == null) {
			cri = new SaleBoardCriteria();
		}
		return saleBoardDao.selectMainSaleBoardList(cri);
	}

	@Override
	public List<SaleImageVO> getFileList(Integer sb_num) {
		if(sb_num == null) {
			return null;
		}
		String si_table = "sale_board";
		return saleBoardDao.selectFileList(si_table, sb_num);
	}

	@Override
	public boolean adminDeleteBoard(Integer sb_num, MemberVO user) {
		if ((sb_num == 0) || !user.getMe_au().equals("admin")) {
			return false;
		}

		try {
			saleBoardDao.deleteAllWish(sb_num);
			saleBoardDao.adminDeleteBoard(sb_num);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

}
