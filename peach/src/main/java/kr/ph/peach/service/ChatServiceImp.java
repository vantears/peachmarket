package kr.ph.peach.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ChatDAO;
import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MessageVO;
@Service
public class ChatServiceImp implements ChatService {

	@Autowired
	ChatDAO chatDao;
	
	@Override
	public ChatVO selectChat(int sb_num, int me_num) {
		if(sb_num == 0 || me_num == 0) {
			return null;
		}
		return chatDao.selectChat(sb_num, me_num);
	}

	@Override
	public void insertChat(int sb_num, int me_num) {
		if(sb_num == 0 || me_num == 0) {
			return;
		}
		int sel_me_num = chatDao.selectSelmenum(sb_num);
		chatDao.insertChat(sb_num, me_num, sel_me_num);
		
	}

	@Override
	public List<ChatVO> selectAllChat(int me_num) {
		if(me_num == 0) {
			return null;
		}
		return chatDao.selectAllChat(me_num);
	}

	@Override
	public List<MessageVO> selectAllMessage(int ch_num) {
		if(ch_num == 0) {
			return null;
		}
		return chatDao.selectAllMessage(ch_num);
	}

	@Override
	public String selectSellerNickName(int ch_sb_num) {
		if(ch_sb_num == 0) {
			return null;
		}
		return chatDao.selectSellerNickName(ch_sb_num);
	}

	@Override
	public String selectbuyerNickName(int ch_me_num) {
		if(ch_me_num == 0) {
			return null;
		}
		return chatDao.selectBuyerNickName(ch_me_num);
	}

	@Override
	public String selectSbName(int ch_sb_num) {
		if(ch_sb_num == 0) {
			return null;
		}
		return chatDao.selectSbName(ch_sb_num);
	}

	@Override
	public void insertMessage(int ch_num, String info, int me_num) {
		if(ch_num == 0 || info == null || me_num == 0) {
			return;
		}
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		chatDao.insertMessage(ch_num, info, me_num, formatedNow);
		chatDao.updateChatDate(ch_num, formatedNow);
	}

	@Override
	public void updateMessageRead(int me_num, int ch_num) {
		if(me_num == 0 || ch_num == 0) {
			return;
		}
		chatDao.updateMessageRead(me_num, ch_num);
		
	}

	@Override
	public ChatVO selectChat(int ch_num) {
		if(ch_num == 0) {
			return null;
		}
		return chatDao.selectChatByChNum(ch_num);
	}
	
	

}
