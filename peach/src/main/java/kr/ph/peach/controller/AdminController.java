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

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SaleBoardService saleBoardService;
	
	@Autowired
	SaleCategoryService saleCategoryService;

	@GetMapping("/home")
	public String home() {

		return "/admin/home";
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
	
		System.out.println(cri);
		model.addAttribute("pm", pm);
		model.addAttribute("mbList", mbList);
		model.addAttribute("StateTypeList", StateTypeList);

		return "/admin/manager";
	}
	
	@PostMapping("/manager")
	public String manager(Model model, HttpSession session, int me_st_num, int me_num) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberService.updateState(me_num, me_st_num);
		
		System.out.println(user);
		
		model.addAttribute("user",user);
		return "redirect:/admin/manager";
		
	}
	
	
	/*
	 * 물품 카테고리 관리
	 * */
	
	@GetMapping("/salecategory")
	public String saleBoardCategory(Model model) {
		
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		System.out.println(categoryList);
		model.addAttribute("categoryList", categoryList);

		return "/admin/salecategory";
	}
	
	@ResponseBody
	@PostMapping("/salecategory/type/insert")
	public Map<String, Object> saleTypeInsert(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = saleCategoryService.insertSaleCategoryType(saleCategory);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/salecategory/type/delete")
	public Map<String, Object> saleTypeDelete(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = saleCategoryService.deleteSaleCategoryType(saleCategory);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/salecategory/type/update")
	public Map<String, Object> saleCategoryTypeUpdate(@RequestBody SaleCategoryVO saleCategory){
		Map<String, Object> map = new HashMap<String, Object>();
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
		System.out.println(ccList);
		model.addAttribute("ccList", ccList);
		return "/admin/communitycategory";
	}
	
	@ResponseBody
	@PostMapping("/communitycategory/type/insert")
	public Map<String, Object> communityTypeInsert(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = saleCategoryService.insertCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/communitycategory/type/delete")
	public Map<String, Object> communityTypeDelete(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = saleCategoryService.deleteCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/communitycategory/type/update")
	public Map<String, Object> communityCategoryTypeUpdate(@RequestBody CommunityCategoryVO communityCategory){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = saleCategoryService.updateCommunityCategoryType(communityCategory);
		map.put("res", res);
		return map;
	}
	
	

	
	
	
	
	
	@GetMapping("/report")
	public String report() {

		return "/admin/report";
	}
	
	
	
	
	
	@GetMapping("/tradereport")
	public String tradeReport() {

		return "/admin/tradereport";
	}
}