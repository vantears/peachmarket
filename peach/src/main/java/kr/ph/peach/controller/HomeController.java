package kr.ph.peach.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.service.TradingRequestService;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.TradingRequestVO;

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
	
	@RequestMapping(value = "/")

	public String home(Model model, HttpSession session, SaleBoardCriteria cri) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null) {
			CityVO userCity = memberService.selectCity(user.getMe_ci_num());
			user.setMe_city_name(userCity.getCi_large() + " " + userCity.getCi_medium() + " " + userCity.getCi_small());
		}
		cri.setPerPageNum(20);
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri);
		for(SaleBoardVO tmp : prList) {
			prList.get(prList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();

		model.addAttribute("user", user);
		model.addAttribute("prList", prList);
		model.addAttribute("categoryList", categoryList);

		
		return "/main/home";
	}
	
	@ResponseBody
	@PostMapping("/common/header")
	public Map<String,Object> updatePost(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		List<TradingRequestVO> trList = tradingRequestService.getTradingRequestList(user);
		map.put("trList", trList);
		System.out.println(trList);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/common/reject")
	public Map<String,Object> rejectPost(@RequestParam("tq_num") int tq_num, Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean rejection = tradingRequestService.deleteTradingRequest(tq_num, model, session);
		if (rejection) {
	        // 삭제 작업이 성공한 경우의 로직
	        map.put("status", "success");
	        map.put("message", "거래 요청이 삭제되었습니다.");
	    } else {
	        // 삭제 작업이 실패한 경우의 로직
	        map.put("status", "error");
	        map.put("message", "거래 요청 삭제에 실패했습니다.");
	    }
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/common/accept")
	public Map<String,Object> accdeptPost(@RequestParam("tq_num") int tq_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		tradingRequestService.changeTradingState(tq_num);
		tradingRequestService.makingTrading(tq_num);
		System.out.println(map);
		return map;
	}


}



