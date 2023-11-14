package kr.ph.peach.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.service.ReportService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReportVO;

@Controller
public class ReportController {
	
	@Autowired
	SaleBoardService saleBoardService;
	
	@Autowired
	ReportService reportService;
	
	@ResponseBody
	@PostMapping("/report")
	public Map<String, Object> report(@RequestBody ReportVO reportVo, Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		String msg = "";
		if(reportVo == null || user == null) {
			msg = "잘못된 접근";
			map.put("msg", msg);
			return map;
		}
		reportVo.setMe_num(user.getMe_num());
		if(reportService.insertReport(reportVo)) {
			msg = "성공";
			map.put("msg", msg);
			return map;			
		}
		msg = "실패";
		map.put("msg", msg);
		return map;
	}

}
