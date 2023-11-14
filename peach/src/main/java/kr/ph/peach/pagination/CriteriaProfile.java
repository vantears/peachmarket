package kr.ph.peach.pagination;

import lombok.Data;

@Data
public class CriteriaProfile {
	private int page; //현재 페이지
	private int perPageNum; //한 페이지에서 컨텐츠 개수
	private String s;
	private String t;
	
	public CriteriaProfile() {
		page = 1;
		perPageNum = 5;
		t = "all";
		s = "";
	}
	
	public CriteriaProfile(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		t = "all";
		s = "";
	}
	//게시글 리스트에서 현재 페이지에 맞는 게시글을 가져오기 위한 시작 번지 
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	
	public String getUrl(int page) {
		return "?t=" + t + "&s=" + s + "&page=" + page;
	}
	public String getUrl() {
		return "?t=" + t + "&s=" + s + "&page=" + page;
	}
}