package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.vo.TradingStateVO;
import kr.ph.peach.vo.TradingVO;

public interface TradingDAO {

	List<TradingVO> gettradingList(@Param("cri")  Criteria cri);

	List<TradingStateVO> getSelectTypeList();

}