package kr.ph.peach.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.service.TradeMessageService;
import kr.ph.peach.service.TradingRequestService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.TradeMessageVO;
import kr.ph.peach.vo.TradingRequestVO;
import kr.ph.peach.vo.WishVO;

@Controller
public class HomeController {

	@Autowired
	SaleCategoryService saleCategoryService;

	@Autowired
	SaleBoardService saleBoardService;

	@Autowired
	MemberService memberService;

	@Autowired
	TradingRequestService tradingRequestService;

	@Autowired
	TradeMessageService tradeMessageService;

	/*
	 * 권한이 관리자가 아닌 회원이 /admin/* 으로 접근할시 경고메세지가 나오도록 출력
	 */
	@GetMapping("/main/message")
	public String message(Model model, HttpSession session, Message msg) {
		// MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		Message message = (Message) session.getAttribute("msg");
		model.addAttribute("message", message);

		return "message";
	}

	@RequestMapping(value = "/")
	public String home(Model model, HttpSession session, SaleBoardCriteria cri) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null) {
			CityVO userCity = memberService.selectCity(user.getMe_ci_num());
			user.setMe_city_name(userCity.getCi_large() + " " + userCity.getCi_medium() + " " + userCity.getCi_small());
			model.addAttribute("user", user);
		}
		cri.setPerPageNum(20);
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri, user);
		for(SaleBoardVO tmp : prList) {
			prList.get(prList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		cri.setPerPageNum(8);
		// 현재 페이지에 맞는 게시글을 가져와야함
		List<SaleBoardVO> list = saleBoardService.getMainSaleBoardList(cri);
		int totalCount = saleBoardService.getTotalCount(cri);

		if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		List<TradingRequestVO> trList = tradingRequestService.getTradingRequestList(user);
		List<TradeMessageVO> tmList = tradeMessageService.getTradeMessageList(user);
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		model.addAttribute("prList", prList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("trList", trList);
		model.addAttribute("tmList", tmList);
		
		return "/main/home";
	}

	@ResponseBody
	@PostMapping("/common/header")
	public Map<String,Object> updatePost(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		List<TradingRequestVO> trList = tradingRequestService.getTradingRequestList(user);
		List<TradeMessageVO> tmList = tradeMessageService.getTradeMessageList(user);
		map.put("trList", trList);
		map.put("tmList", tmList);
		return map;
	}

	@ResponseBody
	@PostMapping("/common/reject")
	public Map<String,Object> rejectPost(@RequestParam("tq_num") int tq_num, Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		TradingRequestVO trv = tradingRequestService.getTradingRequestThat(tq_num);
		tradeMessageService.rejectMessageToCustomer(trv);
		tradingRequestService.addPointToCustomer(tq_num);
		memberService.deleteReducePointHistory(tq_num);
		boolean rejection = tradingRequestService.deleteTradingRequest(tq_num, model, session);
		if (rejection) {
	        // 삭제 작업이 성공한 경우의 로직
	        map.put("status", "success");
	        map.put("message", "거래 요청이 삭제되었습니다.");
	    } else {
	        // 삭제 작업이 실패한 경우의 로직
	    	tradingRequestService.reducePointToCustomer(tq_num);
	        map.put("status", "error");
	        map.put("message", "거래 요청 삭제에 실패했습니다.");
	    }
		return map;
	}


	@ResponseBody
	@PostMapping("/common/accept")
	public Map<String,Object> accdeptPost(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		TradingRequestVO trv = tradingRequestService.getTradingRequestThat(tq_num);
		tradeMessageService.acceptMessageToCustomer(trv);
		tradingRequestService.changeTradingState(tq_num);
		tradingRequestService.makingTrading(tq_num);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/common/confirmT")
	public Map<String,Object> confirmPost(@RequestParam("tm_num") int tm_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		tradeMessageService.confirmPost(tm_num);
		return map;
	}

}
