package kr.ph.peach.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ReportDAO;
import kr.ph.peach.dao.SaleBoardDAO;
import kr.ph.peach.dao.TradingRequestDAO;
import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.ReportVO;
@Service
public class ReportServiceImp implements ReportService {

	@Autowired
	ReportDAO reportDao;

	@Autowired
	TradingRequestDAO tradingRequestDao;

	@Autowired
	SaleBoardDAO saleBoardDao;
	
	@Override
	public boolean insertReport(ReportVO reportVo) {
		if(reportVo == null) {
			return false;
		}
		LocalDateTime now = LocalDateTime.now();
		String formattedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		reportVo.setRp_date(formattedNow);
		reportDao.insertReport(reportVo);
		return true;
	}

	@Override
	public List<ReportVO> getreportList(Criteria cri) {

		return reportDao.getreportList(cri);
	}

	@Override
	public boolean deleteReport(ReportVO report) {

		if(report == null) {
			return false;
		}

		//신고글을 삭제
		return reportDao.deleteReportNum(report.getRp_num());
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new MemberCriteria();
		}
		return reportDao.getTotalCount(cri);
	}

	@Override
	public boolean deleteTradeReport(ReportVO report) {

		saleBoardDao.updateSaleboardTrade(report.getRp_key());

		return tradingRequestDao.deleteTradeReportNum(report.getRp_key());
	}
}
