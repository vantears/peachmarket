package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MessageVO;

public interface ChatDAO {

	ChatVO selectChat(@Param("sb_num")int sb_num, @Param("me_num")int me_num);

	void insertChat(@Param("sb_num")int sb_num, @Param("me_num")int me_num, @Param("sel_me_num")int sel_me_num);

	List<ChatVO> selectAllChat(@Param("me_num")int me_num);

	List<MessageVO> selectAllMessage(@Param("ch_num")int ch_num);

	String selectSellerNickName(@Param("ch_sb_num")int ch_sb_num);

	String selectBuyerNickName(@Param("ch_me_num")int ch_me_num);

	String selectSbName(@Param("ch_sb_num")int ch_sb_num);

	int selectSelmenum(int sb_num);

	void insertMessage(@Param("ch_num")int ch_num, @Param("info")String info, @Param("me_num")int me_num, @Param("date")String formatedNow);

	void updateChatDate(@Param("ch_num")int ch_num, @Param("date")String formatedNow);

	void updateMessageRead(@Param("me_num")int me_num, @Param("ch_num")int ch_num);

	ChatVO selectChatByChNum(int ch_num);

	void deleteMessages(int ch_num);

	void deleteChat(int ch_num);

	ChatVO selectChatBySbNum(Integer sb_num);


}