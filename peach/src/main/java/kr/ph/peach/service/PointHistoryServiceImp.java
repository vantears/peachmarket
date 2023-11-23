package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.PointHistoryDAO;
import kr.ph.peach.pagination.PointHistoryCriteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.PointHistoryVO;

@Service
public class PointHistoryServiceImp implements PointHistoryService {

	@Autowired
	PointHistoryDAO pointHistoryDao;

	@Override
	public List<PointHistoryVO> getPointHistoryList(PointHistoryCriteria cri, MemberVO user) {
		if (cri == null) {
			cri = new PointHistoryCriteria();
		}
		return pointHistoryDao.getPointHistoryList(cri, user);
	}

	@Override
	public int getTotalCount(PointHistoryCriteria cri, MemberVO user) {
		if (cri == null) {
			cri = new PointHistoryCriteria();
		}
		return pointHistoryDao.getTotalCount(cri, user);
	}



}