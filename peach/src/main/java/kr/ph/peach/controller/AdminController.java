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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.service.CommunityService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ReportService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.service.TradingRequestService;
import kr.ph.peach.service.TradingService;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReportVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;
import kr.ph.peach.vo.TradingRequestVO;
import kr.ph.peach.vo.TradingStateVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;

	@Autowired
	SaleBoardService saleBoardService;

	@Autowired
	SaleCategoryService saleCategoryService;

	@Autowired
	ReportService reportService;
	
	@Autowired
	TradingService tradingService;
	
	@Autowired
	TradingRequestService tradingRequestService;
	
	@Autowired
	CommunityService communityService;

	@GetMapping("/home")
	public String home() {

		return "/admin/manager";
	}

	@GetMapping("/manager")
	public String manager(Model model, HttpSession session, MemberCriteria cri) {

		MemberVO user = (MemberVO)session.getAttribute("user");

		cri.setPerPageNum(8);
		// 현재 페이지에 맞는 회원정보를 가져와야함
		List<MemberVO> mbList = memberService.getMemberList(cri);

		List<StatementVO> StateTypeList = saleCategoryService.getMemberTypeList(user);

		int totalCount = memberService.getTotalCount(cri);

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);

		model.addAttribute("pm", pm);
		model.addAttribute("mbList", mbList);
		model.addAttribute("StateTypeList", StateTypeList);

		return "/admin/manager";
	}

	@PostMapping("/manager")
	public String manager(Model model, HttpSession session, int me_st_num, int me_num) {

		MemberVO user = (MemberVO)session.getAttribute("user");
		memberService.updateState(me_num, me_st_num);

		model.addAttribute("user",user);
		return "redirect:/admin/manager";

	}


	/*
	 * 물품 카테고리 관리
	 * */

	@GetMapping("/salecategory")
	public String saleBoardCategory(Model model) {

		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		model.addAttribute("categoryList", categoryList);

		return "/admin/salecategory";
	}

	@ResponseBody
	@PostMapping("/salecategory/type/insert")
	public Map<String, Object> saleTypeInsert(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.insertSaleCategoryType(saleCategory);
		map.put("res", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/salecategory/type/delete")
	public Map<String, Object> saleTypeDelete(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.deleteSaleCategoryType(saleCategory);
		map.put("res", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/salecategory/type/update")
	public Map<String, Object> saleCategoryTypeUpdate(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.updateSaleCategoryType(saleCategory);
		map.put("res", res);
		return map;
	}

	/*
	 * 커뮤니티 카테고리 관리
	 * */

	@GetMapping("/communitycategory")
	public String communityCategory(Model model) {

		List<CommunityCategoryVO> ccList = saleCategoryService.getCommunityCategoryList();
		model.addAttribute("ccList", ccList);
		return "/admin/communitycategory";
	}

	@ResponseBody
	@PostMapping("/communitycategory/type/insert")
	public Map<String, Object> communityTypeInsert(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.insertCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/communitycategory/type/delete")
	public Map<String, Object> communityTypeDelete(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.deleteCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/communitycategory/type/update")
	public Map<String, Object> communityCategoryTypeUpdate(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<>();
		boolean res = saleCategoryService.updateCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}

	/* 신고페이지 관리 */
	@GetMapping("/report")
	public String report(Model model, HttpSession session, Criteria cri) {

		List<ReportVO> report = reportService.getreportList(cri);
		model.addAttribute("report", report);

		int totalCount = reportService.getTotalCount(cri);

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		model.addAttribute("pm", pm);

		return "/admin/report";
	}

	@GetMapping("/delete")
	public String reportDelete(Integer sb_num, HttpSession session, Model model, MemberCriteria cri, ReportVO report) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		saleBoardService.adminDeleteBoard(sb_num, user);

		List<ReportVO> reportlist = reportService.getreportList(cri);
		model.addAttribute("report", reportlist);

		return "/admin/report";
	}

	@ResponseBody // ajax를 받기위해 필요
	@PostMapping("/report/delete")
	public Map<String, Object> reportDeleteNum(@RequestBody ReportVO report){
		Map<String, Object> map = new HashMap<>();
		boolean res = reportService.deleteReport(report);
		map.put("res", res);
		return map;
	}
	
	
	@GetMapping("/communityreport")
	public String communityReport(Model model, HttpSession session, Criteria cri) {

		List<ReportVO> report = reportService.getreportList(cri);
		model.addAttribute("report", report);
		
		int totalCount = reportService.getTotalCount(cri);

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		model.addAttribute("pm", pm);
		
		return "/admin/communityreport";
	}
	
	
	
	
	
	@GetMapping("/tradereport")
	public String tradeReport(Model model, HttpSession session, Criteria cri) {

		
		List<TradingRequestVO> trList = tradingRequestService.getTradingRequestsList();
		model.addAttribute("trList", trList);
		List<ReportVO> report = reportService.getreportList(cri);
		model.addAttribute("report", report);

		List<TradingStateVO> StateTypeList = tradingService.getTradeTypeList();
		model.addAttribute("StateTypeList", StateTypeList);
		int totalCount = reportService.getTotalCount(cri);

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);

		model.addAttribute("pm", pm);
		
		return "/admin/tradereport";
	}
	
	@ResponseBody // ajax를 받기위해 필요
	@PostMapping("/report/tradedelete")
	public Map<String, Object> reportTradeDelete(@RequestBody ReportVO report){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = reportService.deleteTradeReport(report);
		
		map.put("res", res);
		
		return map;
	}
}