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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.service.TradingRequestService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.TradingRequestVO;
import kr.ph.peach.vo.WishVO;


@Controller
public class TradePageController {

	@Autowired
	SaleBoardService saleBoardService;

	@Autowired
	TradingRequestService tradingRequestService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SaleCategoryService saleCategoryService;

	@GetMapping("/sale/tradePage")
    public String TradePage(Model model, HttpSession session, Integer tq_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		List<TradingRequestVO> trList = tradingRequestService.getTradingRequests(user, tq_num);
		 if (user != null) {
				List<WishVO> wishList = memberService.getWishList(user.getMe_num());
				model.addAttribute("wishList", wishList);
			}
	    List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		model.addAttribute("categoryList", categoryList);
        model.addAttribute("trList", trList);
        return "/sale/tradePage"; // 뷰의 이름으로 사용될 수 있는 HTML 페이지의 이름
    }
	@ResponseBody
	@PostMapping("/sale/undertake")
	public Map<String,Object> underTake(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<>();
		tradingRequestService.changeTradingCuState(tq_num);
		return map;
	}

	@ResponseBody
	@PostMapping("/sale/undertakeCancel")
	public Map<String,Object> underTakeCancel(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<>();
		tradingRequestService.changeTradingCuStateCancel(tq_num);
		return map;
	}

	@ResponseBody
	@PostMapping("/sale/giveitem")
	public Map<String,Object> giveItem(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<>();
		tradingRequestService.changeTradingSeState(tq_num);
		return map;
	}

	@ResponseBody
	@PostMapping("/sale/giveitemCancel")
	public Map<String,Object> giveItemCancel(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<>();
		tradingRequestService.changeTradingSeStateCancel(tq_num);
		return map;
	}
}
