package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.vo.ReportVO;

public interface ReportService {


	boolean insertReport(ReportVO reportVo);

	List<ReportVO> getreportList(Criteria cri);

	boolean deleteReport(ReportVO report);

	int getTotalCount(Criteria cri);

	boolean deleteTradeReport(ReportVO report);
	
}
