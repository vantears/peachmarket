package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.service.ChatService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.MessageVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.WishVO;


@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	SaleCategoryService saleCategoryService;
	
	@Autowired
	SaleBoardService saleBoardService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	ChatService chatService;	
	
	@GetMapping("/chat")
	public String chat(Model model, HttpSession session, int sb_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		SaleBoardVO saleBoard = saleBoardService.selectBoard(sb_num);
		Message msg;
		if(user == null) {
			msg = new Message("/member/login", "로그인이 필요합니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		if(sb_num != 0 && saleBoard == null) {
			msg = new Message("", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		if(saleBoard != null && user.getMe_num() == saleBoard.getSb_me_num()) {
			msg = new Message("/saleboard/detail?sb_num="+sb_num, "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		ChatVO chat = chatService.selectChat(sb_num, user.getMe_num());
		if(sb_num != 0 && saleBoard.getSb_ss_num() != 3) {
			if(chat == null && saleBoard.getSb_me_num() != user.getMe_num()){
				chatService.insertChat(sb_num, user.getMe_num());
				chat = chatService.selectChat(sb_num, user.getMe_num());
			}
		}
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		if (user != null) {
			List<WishVO> wishList = memberService.getWishList(user.getMe_num());
			model.addAttribute("wishList", wishList);
		}
		model.addAttribute("categoryList", categoryList);
		List<ChatVO> chatList = chatService.selectAllChat(user.getMe_num());
		for(ChatVO tmp : chatList) {
			List<MessageVO> messageVO = chatService.selectAllMessage(tmp.getCh_num());
			chatList.get(chatList.indexOf(tmp)).setCh_seller_nickname(chatService.selectSellerNickName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_buyer_nickname(chatService.selectbuyerNickName(tmp.getCh_me_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_sb_name(chatService.selectSbName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setMessageVO(messageVO);
			if(tmp.getCh_me_num() == user.getMe_num()) {
				ProfileVO profile = profileService.selectProfile(tmp.getCh_sel_me_num());
				ProfileImageVO proImg = profileService.selectImg(profile.getPf_num());
				chatList.get(chatList.indexOf(tmp)).setPi_name(proImg == null ? null : proImg.getPi_name());				
			} else {
				ProfileVO profile = profileService.selectProfile(tmp.getCh_me_num());
				ProfileImageVO proImg = profileService.selectImg(profile.getPf_num());
				chatList.get(chatList.indexOf(tmp)).setPi_name(proImg == null ? null : proImg.getPi_name());	
			}
		}
		//프로파일 넘버로 프로파일 이미지 가져오기
		model.addAttribute("chatList", chatList);
		model.addAttribute("user", user);
		model.addAttribute("sb_num", sb_num);
		return "/chat/chat";
	}

	@GetMapping("/chat-list")
	public String chatList(Model model, HttpSession session, Integer sb_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null) {
			Message msg = new Message("/", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		if(user != null) {
			List<ChatVO> chatList = chatService.selectAllChat(user.getMe_num());
			for(ChatVO tmp : chatList) {
				List<MessageVO> messageVO = chatService.selectAllMessage(tmp.getCh_num());
				int count = 0;
				for(MessageVO msg : messageVO) {
					if(msg.getMs_unread() == 0 && user.getMe_num() != msg.getMs_me_num()) {
						count++;
					}
				}
				chatList.get(chatList.indexOf(tmp)).setUnreadCount(count);
				chatList.get(chatList.indexOf(tmp)).setCh_seller_nickname(chatService.selectSellerNickName(tmp.getCh_sb_num()));
				chatList.get(chatList.indexOf(tmp)).setCh_buyer_nickname(chatService.selectbuyerNickName(tmp.getCh_me_num()));
				chatList.get(chatList.indexOf(tmp)).setCh_sb_name(chatService.selectSbName(tmp.getCh_sb_num()));
				chatList.get(chatList.indexOf(tmp)).setMessageVO(messageVO);
				if(tmp.getCh_me_num() == user.getMe_num()) {
					ProfileVO profile = profileService.selectProfile(tmp.getCh_sel_me_num());
					ProfileImageVO proImg = profileService.selectImg(profile.getPf_num());
					chatList.get(chatList.indexOf(tmp)).setPi_name(proImg == null ? null : proImg.getPi_name());				
				} else {
					ProfileVO profile = profileService.selectProfile(tmp.getCh_me_num());
					ProfileImageVO proImg = profileService.selectImg(profile.getPf_num());
					chatList.get(chatList.indexOf(tmp)).setPi_name(proImg == null ? null : proImg.getPi_name());	
				}
			}		
			model.addAttribute("chatList", chatList);
		}
		model.addAttribute("user", user);
		return "/chatsub/chat-list";
	}

	@GetMapping("/message-list")
	public String messageList(Model model, HttpSession session, int ch_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null) {
			Message msg = new Message("/", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		chatService.updateMessageRead(user.getMe_num(), ch_num);
		List<MessageVO> messageList = chatService.selectAllMessage(ch_num);
		ChatVO chat = chatService.selectChat(ch_num);
		if(chat == null) {
			Message msg = new Message("/", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		SaleBoardVO saleBoard = saleBoardService.selectBoard(chat.getCh_sb_num());
		model.addAttribute("user", user);
		model.addAttribute("messageList", messageList);
		model.addAttribute("board", saleBoard);
		return "/chatsub/message-list";
	}

	@ResponseBody
	@PostMapping("/message-send")
	public void messageSend(Model model, HttpSession session, int ch_num, String info) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user != null) {
			chatService.insertMessage(ch_num, info, user.getMe_num());
		}
	}
}
