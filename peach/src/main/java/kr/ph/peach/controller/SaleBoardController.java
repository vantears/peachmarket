package kr.ph.peach.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.service.TradingRequestService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.TradingRequestVO;
import kr.ph.peach.vo.WishVO;


@Controller
@RequestMapping("/saleboard")
public class SaleBoardController {
	
	@Autowired
	MemberService memberService;

	@Autowired
	SaleBoardService saleBoardService;
	
	@Autowired
	SaleCategoryService saleCategoryService;
	
	@Autowired
	TradingRequestService tradingRequestService;
	
	//메인페이지 API
	@GetMapping("/{sc_num}")
	public String productsList(@PathVariable("sc_num") int categoryId, Model model, HttpSession session, SaleBoardCriteria cri) {
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri);
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}
		for(SaleBoardVO tmp : prList) {
			prList.get(prList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		String categoryName = "전체보기";
		if(categoryId > 0) {
			categoryName = categoryList.get(categoryId - 1).getSc_name();			
		}
		cri.setSc_num(categoryId);
		//전체 게시글 수 
		int totalCount = saleBoardService.getTotalCount(cri);
		//페이지네이션에서 최대 페이지 개수 
		int displayPageNum = 20;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("pm", pm);
		model.addAttribute("prList",prList);
		model.addAttribute("categoryList", categoryList);
		return "/saleboard/saleBoard";
	}
	
	//중고거래 게시글 페이지 불러오기
	@GetMapping("/insert")
	public String insert(Model model, HttpSession session, SaleBoardVO saleBoard) {
		//게시물 카테고리 불러와 페이지로 넘겨줌
		List<SaleCategoryVO> dbCategory = saleBoardService.selectAllCategory();
		model.addAttribute("dbCategory", dbCategory);
		MemberVO user = (MemberVO)session.getAttribute("user");
		//유저가 없으면 로그인 필요 메시지 보낸 
		Message msg;
		if(user == null) {
			msg = new Message("member/login", "로그인이 필요합니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		
		return "/saleboard/insert";
	}
	
	//중고거래 게시글 페이지 제출
	@PostMapping("/insert")
	public String insertPost(Model model, SaleBoardVO saleBoard, HttpSession session, MultipartFile[] files) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(saleBoardService.insertBoard(saleBoard, user, files)) {
			//게시물 등록 성공 시 등록한 게시물 상세페이지로 이
			msg = new Message("saleboard/detail?sb_num=" + saleBoard.getSb_num(), "게시물이 등록되었습니다.");
		} else {
			msg = new Message("saleboard/insert", "게시물 등록에 실패했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	//검색 시 나오는 검색결과 페이지
	@GetMapping("/list")
	public String list(Model model, SaleBoardCriteria cri, HttpSession session) {
		List<SaleBoardVO> dbBoardList = saleBoardService.selectAllBoard2(cri);
		
		for(SaleBoardVO tmp : dbBoardList) {
			//객체의 회원번호로 회원 닉네임을 가져온 후 해당 객체의 닉네임에 저장(db에서 게시물이 회원번호만 외래키로 가지고 있고 닉네임 정보는 가져와야함)
			dbBoardList.get(dbBoardList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		int totalCount = saleBoardService.getTotalCount(cri);
		int displayPageNum = 24;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);

		model.addAttribute("pm", pm);
		
		model.addAttribute("dbBoardList", dbBoardList);
		return "/saleboard/list";
	}
	
	//중고거래 게시물 상세페이지
	@GetMapping("/detail")
	public String detail(Model model, Integer sb_num, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		SaleBoardVO board = saleBoardService.selectBoard(sb_num);
		if(board == null) {
			Message msg = new Message("", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		List<SaleImageVO> imageList = saleBoardService.getFileList(sb_num);
		board.setSaleImageVOList(imageList);
		board.setSb_me_nickname(saleBoardService.selectMemberNickname(board.getSb_me_num()));
		board.setSb_sc_name(saleBoardService.selectCategoryName(board.getSb_sc_num()));
		board.setSb_me_sugar(saleBoardService.selectMemberSugar(board.getSb_me_num()));
		if(user != null && board != null) {
			WishVO dbWish = saleBoardService.selectWish(user.getMe_num(), board.getSb_num());			
			int wishCheck = 0;
			if(dbWish == null) {
				wishCheck = 0;
			} else {
				wishCheck = 1;
			}
			model.addAttribute("wishCheck", wishCheck);
		}
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		return "/saleboard/detail";
		
	}
	
	//중고거래 게시물 수정 페이지 불러오기
	@GetMapping("/update")
	public String update(Model model, HttpSession session, Integer sb_num) {
		List<SaleCategoryVO> dbCategory = saleBoardService.selectAllCategory();
		model.addAttribute("dbCategory", dbCategory);
		SaleBoardVO board = saleBoardService.selectBoard(sb_num);
		List<SaleImageVO> imageList = saleBoardService.getFileList(sb_num);
		board.setSaleImageVOList(imageList);
		board.setSb_sc_name(saleBoardService.selectCategoryName(board.getSb_sc_num()));
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null || board == null || user.getMe_num() != board.getSb_me_num()) {
			Message msg = new Message("saleboard/detail?sb_num=" + sb_num, "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		model.addAttribute("board", board);
		
		return "/saleboard/update";
	}
	
	//중고거래 게시물 수정 페이지 제출
	@PostMapping("/update")
	public String updatePost(Model model, HttpSession session, SaleBoardVO board, MultipartFile[] files,Integer[] delFiles) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(saleBoardService.updateBoard(board, user, files, delFiles)) {
			msg = new Message("/saleboard/detail?sb_num="+board.getSb_num(), "수정되었습니다.");
		}else {
			msg = new Message("/saleboard/update?sb_num="+board.getSb_num(), "수정을 실패하였습니다."); 
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	//중고거래 게시물 삭제 페이지
	@GetMapping("/delete")
	public String delete(Integer sb_num, HttpSession session, Model model, SaleBoardVO saleBoard) {
		MemberVO user = (MemberVO)session.getAttribute("user");
	    SaleBoardVO saleBoardBeforeDeletion = saleBoardService.selectBoard(sb_num); // 게시글 번호로 판매 게시글 가져오는 메서드
	    int previousSbScNum = saleBoardBeforeDeletion.getSb_sc_num(); //미리 게시글 카테고리 번호를 저장하여 해당 카테고리 목록으로 페이지 반환
		Message msg;
		if(saleBoardService.deleteBoard(sb_num, user)) {
			msg = new Message("saleboard/" + previousSbScNum, "삭제되었습니다.");
		} else {
			msg = new Message("saleboard/" + previousSbScNum, "잘못된 접근입니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	//중고거래 게시물 찜 눌렀을 때 ajax로 처리
	@ResponseBody
	@PostMapping("/wish")
	public Map<String, Object> ajaxTest(@RequestBody WishVO wish){
		Map<String, Object> map = new HashMap<String, Object>();
		//찜 상태를 0으로 초기화하고 db에 찜 내역이 없다면 찜을 추가하고 찜 상태를 1로, 찜 내역이 있다면 찜을 삭제하고 찜 상태를 0으로 반환한다.
		WishVO dbWish = saleBoardService.selectWish(wish.getWi_me_num(), wish.getWi_sb_num());
		int isWish = 0;
		if(dbWish == null) {
			saleBoardService.insertWish(wish);
			isWish = 1;
		} else {
			saleBoardService.deleteWish(wish);
			isWish = 0;
		}
		SaleBoardVO board = saleBoardService.selectBoard(wish.getWi_sb_num());
		map.put("isWish", isWish);
		map.put("board", board);
		return map;
	}
	
	//거래 요청 시 ajax로 불러오는 페이지
	@ResponseBody
	@PostMapping("/detail")
	public Map<String, Object> tradePost(@RequestBody TradingRequestVO tradingRequest, HttpSession session) {
	    Map<String, Object> map = new HashMap<>();
        boolean trade = tradingRequestService.tradePost(tradingRequest.getTq_sb_num(), tradingRequest.getTq_me_num());
        System.out.println(trade);
        if (trade) {
	        map.put("status", "success");
	        map.put("message", "직거래를 요청하였습니다.");
	    } else {
	        map.put("status", "error");
	        map.put("message", "이미 직거래를 신청한 물품입니다.");
	    }

	    System.out.println(map);
	    return map;
	}
}
