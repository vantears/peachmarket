package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.ReportVO;

public interface ReportDAO {

	void insertReport(@Param("reportVo") ReportVO reportVo);


}