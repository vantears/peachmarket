package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MessageVO;



public interface ChatService {

	ChatVO selectChat(int sb_num, int me_num);

	void insertChat(int sb_num, int me_num);

	List<ChatVO> selectAllChat(int me_num);

	List<MessageVO> selectAllMessage(int ch_num);

	String selectSellerNickName(int ch_sb_num);

	String selectbuyerNickName(int ch_me_num);

	String selectSbName(int ch_sb_num);

	void insertMessage(int ch_num, String info, int me_num);

	void updateMessageRead(int me_num, int ch_num);

	ChatVO selectChat(int ch_num);

	
}
