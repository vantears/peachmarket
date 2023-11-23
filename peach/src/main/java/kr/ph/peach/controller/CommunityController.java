package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.PageMakerCom;
import kr.ph.peach.service.CommunityService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.LikesVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.WishVO;

@Controller
public class CommunityController {

	@Autowired
	CommunityService communityService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SaleCategoryService saleCategoryService;
	
	@GetMapping("/board/community")
	public String Community(Model model, HttpSession session, CriteriaCom cri) {
		MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
	    
	    if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}
	    List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		model.addAttribute("categoryList", categoryList);
	    
	    Message msg;
	    if(user == null) {
    		msg = new Message("/member/login", "로그인을 필요로 합니다.");
          	model.addAttribute("msg", msg);
      		return "message";
    	}
	    
	    List<CommunityVO> list = communityService.getBoardList(cri,user);
	    List<CommunityCategoryVO> communityCategoryList = communityService.getCategoryList();
	    model.addAttribute("communityCategoryList", communityCategoryList);
	    session.setAttribute("list", list);
	 
	    model.addAttribute("list", list);
	    int totalCount = communityService.getTotalCount(cri, user);
		//페이지네이션 페이지수
		final int DISPLAY_PAGE_NUM = 3;
		PageMakerCom cpm = new PageMakerCom(DISPLAY_PAGE_NUM, cri, totalCount);
		model.addAttribute("title", "게시글 조회");
		model.addAttribute("cpm", cpm);


		return "/board/community";
	}

	@GetMapping("/board/communityInsert")
	public String CommunityInsert(Model model, HttpSession session) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
	    
	    if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}
	    List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		model.addAttribute("categoryList", categoryList);

	    //커뮤니티 카테고리 select 추가 - 옵션에 넣기 위해
	    List<CommunityCategoryVO> CCategory = communityService.selectCCategory();
	    List<String> CCNames = new ArrayList<>();

	    for (CommunityCategoryVO category : CCategory) {
	        CCNames.add(category.getCc_name());
	    }

	    model.addAttribute("CCNames", CCNames);

	    if (user == null) {
	        return "redirect:/member/login";
	    }

	    return "/board/communityInsert";
	}

	@PostMapping("/board/communityInsert")
	public String insertPost(Model model, CommunityVO community, HttpSession session,
			MultipartFile [] fileList, @RequestParam("CICategory") String CICategory) {
		MemberVO user = (MemberVO)session.getAttribute("user");

		if("0".equals(CICategory)) {
			return "redirect:/board/communityInsert";
		}else {
			int cc_num = communityService.selectCIname(CICategory);
			boolean res = communityService.insertCommunity(community, user, fileList,cc_num);
			if(res) {
				model.addAttribute("msg", "게시글 등록 성공!");
				model.addAttribute("url", "/board/community");
			}else {
				model.addAttribute("msg", "게시글 등록 실패!");
				model.addAttribute("url", "/board/communityInsert");
			}
			return "/main/message";
		}
	}
	@GetMapping("/board/communityDetail/{co_num}")
    public String showProfilePage(@PathVariable("co_num") int co_num, Model model, HttpSession session) {
	    	MemberVO user = (MemberVO) session.getAttribute("user");
	    	model.addAttribute("user",user);
	    	
	    	Message msg;
		    if(user == null) {
	    		msg = new Message("/member/login", "로그인을 필요로 합니다.");
	          	model.addAttribute("msg", msg);
	      		return "message";
	    	}
		    if (user != null) {
				List<WishVO> wishList = memberService.getWishList(user.getMe_num());
				model.addAttribute("wishList", wishList);
			}
		    List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
			model.addAttribute("categoryList", categoryList);
			
	    	communityService.updateCoView(co_num);

	    	CommunityVO detail = communityService.selectDetail(co_num);
	    	model.addAttribute("detail",detail);

	    	MemberVO writer = communityService.selectWriter(detail);
	    	model.addAttribute("writer",writer);

	    	List<ReplyVO> reply = communityService.selectReply(co_num);

	    	// 댓글 작성자의 닉네임을 가져와서 ReplyVO에 설정
	    	List<ReplyVO> replyList = new ArrayList<>();
	        for (ReplyVO re : reply) {
	            String replyWriter = communityService.getReNick(re);
	            re.setReplyWriter(replyWriter);
	            replyList.add(re);
	        }

	        model.addAttribute("reList", replyList);

	        CommunityImageVO coImage = communityService.getCoImg(co_num);
	        model.addAttribute("coImage", coImage);


	     // 댓글 수 업데이트
	        communityService.updateReply(co_num);

	    	return "/board/communityDetail";
	}
	@PostMapping("/board/communityDetail")
	public String insertPost(Model model, HttpSession session, @RequestParam("re_info")String re_info,  @RequestParam("co_num") int co_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Message msg;

		if(re_info.isEmpty()) {
			return "redirect:/board/communityDetail/" + co_num;
		}
		if (user == null) {
        	msg = new Message("/member/login", "로그인을 필요로 합니다.");
        	model.addAttribute("msg", msg);
        	return "message";
        } else {

        	communityService.insertReply(re_info, co_num, user);

        	msg = new Message("/board/communityDetail/"+co_num, "댓글 입력 완료.");
        	model.addAttribute("msg", msg);
    		return "message";
        }
	}
	@GetMapping("/board/communityEdit/{co_num}")
	public String CommunityEdit(@PathVariable("co_num") int co_num, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);

	    if (user == null) {
	        return "redirect:/member/login";
	    }
	    
	    if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}
	    List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		model.addAttribute("categoryList", categoryList);

	    CommunityVO detail = communityService.selectDetail(co_num);
    	model.addAttribute("detail",detail);

    	CommunityCategoryVO EditCategory = communityService.selectEditCC(detail);
    	model.addAttribute("EditCategory",EditCategory);

    	List<CommunityCategoryVO> CCategory = communityService.selectCCategory();
	    List<String> CCNames = new ArrayList<>();

	    for (CommunityCategoryVO category : CCategory) {
	        CCNames.add(category.getCc_name());
	    }
	    model.addAttribute("CCNames", CCNames);

	    //co_num으로 해당글의 이미지 불러오기, 필요 없어지면 지워야함
	    CommunityImageVO editImg = communityService.selecteditImg(co_num);
    	model.addAttribute("editImg",editImg);

		return "/board/communityEdit";
	}

	@PostMapping("/board/communityEdit/{co_num}")
	public String updatePost(@PathVariable("co_num") int co_num, Model model,@ModelAttribute("community") CommunityVO community, HttpSession session,
			MultipartFile [] fileList, @RequestParam("CICategory") String CICategory, @RequestParam("editImg") String editImg) {
		MemberVO user = (MemberVO)session.getAttribute("user");

		if("0".equals(CICategory)) {
			return "redirect:/board/communityEdit";
		}else {
			int cc_num = communityService.selectCIname(CICategory);
			boolean res = communityService.updateCommunity(community, co_num, fileList,cc_num ,user, editImg);

			if(res) {
				model.addAttribute("msg", "게시글 수정 성공!");
				model.addAttribute("url", "/board/community");
			}else {
				model.addAttribute("msg", "게시글 수정 실패!");
				model.addAttribute("url", "/board/community");
			}
			return "/main/message";
		}
	}
	@PostMapping("/board/communityDetail/{coNum}")
	@ResponseBody
	public boolean likeCommunity(@PathVariable("coNum") int coNum, HttpSession session) {
			MemberVO user = (MemberVO)session.getAttribute("user");

			if (user == null) {
		        return false;
		    }
			LikesVO lk_co_num = communityService.selectLkCoNum(user, coNum);
			//이미 좋아요를 눌렀는지 확인
			if(lk_co_num == null) {
				//좋아요 등록
				communityService.insertLike(coNum, user);
			}else {
				return false;
			}
			communityService.increaseLikeCount(coNum);
			return true;
	}
	@ResponseBody
    @PostMapping("/board/comDelete")
	public String deleteCom(Integer co_num, Model model) {
		Message msg;
		if(communityService.deleteCOM(co_num)) {
			msg = new Message("/board/community", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/board/community", "잘못된 접근입니다.");
		}
		model.addAttribute(msg);
		return "Message";
	}
	@ResponseBody
    @PostMapping("/board/deleteUploadedFile")
	public String deleteComImg(@RequestParam("co_num") int co_num, Model model) {

		Message msg;
		if(communityService.deleteComImg(co_num)) {
			msg = new Message("/board/community", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/board/community", "잘못된 접근입니다.");
		}
		model.addAttribute(msg);
		return "Message";
	}

	@ResponseBody
	@PostMapping("/board/replyDelete")
	public String replyDelete(@RequestParam("re_num")int re_num, Model model) {
	    Message msg;
	    if (communityService.replyDelete(re_num)) {
	        msg = new Message("/board/community", "댓글을 삭제했습니다.");
	    } else {
	        msg = new Message("/board/community", "잘못된 접근입니다.");
	    }
	    model.addAttribute(msg);
	    return "Message";
	}
}