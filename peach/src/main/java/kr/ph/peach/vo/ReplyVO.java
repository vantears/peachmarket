package kr.ph.peach.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int re_num, re_co_num, re_me_num;
	private String re_info;
	private String replyWriter;

    public ReplyVO getReply() {
        return this; // 현재 객체를 리턴하는 메서드를 추가
    }
}