package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.PointHistoryCriteria;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.PointHistoryVO;

public interface PointHistoryDAO {

	List<PointHistoryVO> getPointHistoryList(@Param("cri")PointHistoryCriteria cri, @Param("user")MemberVO user);

	int getTotalCount(@Param("cri")PointHistoryCriteria cri, @Param("user")MemberVO users);

}