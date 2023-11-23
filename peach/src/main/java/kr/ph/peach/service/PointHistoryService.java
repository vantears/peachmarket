package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.pagination.PointHistoryCriteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.PointHistoryVO;

public interface PointHistoryService {

	List<PointHistoryVO> getPointHistoryList(PointHistoryCriteria cri, MemberVO user);

	int getTotalCount(PointHistoryCriteria cri, MemberVO user);

}